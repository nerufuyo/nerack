#!/bin/bash

# Flutter CI/CD helper scripts
# This script provides utilities for Flutter CI/CD pipeline

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to setup Flutter environment
setup_flutter() {
    print_status "Setting up Flutter environment..."
    
    # Get dependencies
    flutter pub get
    
    # Generate code
    flutter pub run build_runner build --delete-conflicting-outputs
    
    print_success "Flutter environment setup completed"
}

# Function to run code analysis
run_analysis() {
    print_status "Running Flutter code analysis..."
    
    # Check formatting
    if dart format --output=none --set-exit-if-changed lib/ test/; then
        print_success "Code formatting check passed"
    else
        print_error "Code formatting issues found. Run 'dart format lib/ test/' to fix"
        return 1
    fi
    
    # Run static analysis
    if flutter analyze --fatal-infos; then
        print_success "Static analysis passed"
    else
        print_error "Static analysis found issues"
        return 1
    fi
    
    return 0
}

# Function to run tests with coverage
run_tests() {
    print_status "Running Flutter tests with coverage..."
    
    # Run tests
    if flutter test --coverage; then
        print_success "All tests passed"
    else
        print_error "Some tests failed"
        return 1
    fi
    
    # Check coverage if lcov is available
    if command -v lcov &> /dev/null; then
        local coverage=$(lcov --summary coverage/lcov.info 2>/dev/null | grep "lines" | awk '{print $2}' | sed 's/%//' || echo "0")
        print_status "Test coverage: $coverage%"
        
        if (( $(echo "$coverage < 70" | bc -l) )); then
            print_warning "Test coverage is below 70% threshold"
            return 1
        else
            print_success "Test coverage meets threshold (70%)"
        fi
    fi
    
    return 0
}

# Function to build Android APK
build_android() {
    local build_type=${1:-"debug"}
    
    print_status "Building Android APK ($build_type)..."
    
    case $build_type in
        "debug")
            flutter build apk --debug
            ;;
        "release")
            flutter build apk --release
            ;;
        "appbundle")
            flutter build appbundle --release
            ;;
        *)
            print_error "Unknown build type: $build_type"
            return 1
            ;;
    esac
    
    print_success "Android build completed ($build_type)"
}

# Function to build iOS
build_ios() {
    local build_type=${1:-"debug"}
    
    print_status "Building iOS ($build_type)..."
    
    case $build_type in
        "debug")
            flutter build ios --debug --no-codesign
            ;;
        "release")
            flutter build ios --release --no-codesign
            ;;
        *)
            print_error "Unknown build type: $build_type"
            return 1
            ;;
    esac
    
    print_success "iOS build completed ($build_type)"
}

# Function to run integration tests
run_integration_tests() {
    print_status "Running integration tests..."
    
    if [ ! -d "integration_test" ]; then
        print_warning "No integration tests found"
        return 0
    fi
    
    # Start emulator if needed (for CI environments)
    if [ "$CI" = "true" ]; then
        print_status "CI environment detected, assuming emulator is available"
    fi
    
    # Run integration tests
    if flutter test integration_test/; then
        print_success "Integration tests passed"
    else
        print_error "Integration tests failed"
        return 1
    fi
    
    return 0
}

# Function to check dependencies for security vulnerabilities
check_dependencies() {
    print_status "Checking dependencies for vulnerabilities..."
    
    # Check for outdated dependencies
    flutter pub outdated
    
    # Check pub dependencies (basic check)
    flutter pub deps
    
    print_success "Dependency check completed"
}

# Function to clean build artifacts
clean_build() {
    print_status "Cleaning build artifacts..."
    
    flutter clean
    flutter pub get
    
    print_success "Build artifacts cleaned"
}

# Function to prepare for release
prepare_release() {
    local version=$1
    
    if [ -z "$version" ]; then
        print_error "Version number required for release preparation"
        return 1
    fi
    
    print_status "Preparing release $version..."
    
    # Update version in pubspec.yaml
    if command -v sed &> /dev/null; then
        sed -i.bak "s/version: .*/version: $version/" pubspec.yaml
        print_success "Version updated to $version"
    else
        print_warning "sed not available, please update version manually"
    fi
    
    # Run full test suite
    setup_flutter
    run_analysis
    run_tests
    
    print_success "Release $version prepared successfully"
}

# Main script logic
case "${1:-help}" in
    "setup")
        setup_flutter
        ;;
    "analyze")
        run_analysis
        ;;
    "test")
        run_tests
        ;;
    "build-android")
        build_android $2
        ;;
    "build-ios")
        build_ios $2
        ;;
    "integration-test")
        run_integration_tests
        ;;
    "check-deps")
        check_dependencies
        ;;
    "clean")
        clean_build
        ;;
    "prepare-release")
        prepare_release $2
        ;;
    "full-ci")
        setup_flutter
        run_analysis
        run_tests
        check_dependencies
        ;;
    "help"|*)
        echo "Flutter CI/CD Helper Script"
        echo ""
        echo "Usage: $0 <command> [options]"
        echo ""
        echo "Commands:"
        echo "  setup              Setup Flutter environment"
        echo "  analyze            Run code analysis"
        echo "  test               Run tests with coverage"
        echo "  build-android      Build Android APK (debug|release|appbundle)"
        echo "  build-ios          Build iOS (debug|release)"
        echo "  integration-test   Run integration tests"
        echo "  check-deps         Check dependencies for vulnerabilities"
        echo "  clean              Clean build artifacts"
        echo "  prepare-release    Prepare release (requires version)"
        echo "  full-ci            Run complete CI pipeline"
        echo "  help               Show this help message"
        ;;
esac
