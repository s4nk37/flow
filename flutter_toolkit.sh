#!/usr/bin/env bash

# Ensure the script doesn't exit on error, but we can still trap if needed
set +e

################################################################################
#                         🧰 FLUTTER TOOLKIT v3.0                          #
#               A powerful CLI assistant for your Flutter projects             #
################################################################################

# ------------------------------------------------------------------------------
# COLORS & STYLES
# ------------------------------------------------------------------------------
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
CYAN="\033[36m"
MAGENTA="\033[35m"
BOLD="\033[1m"
RESET="\033[0m"

# ------------------------------------------------------------------------------
# UTILITIES
# ------------------------------------------------------------------------------
spinner() {
  local pid=$!
  local delay=0.1
  local spin='|/-\'
  while ps -p $pid >/dev/null; do
    for i in ${spin}; do
      printf "\r${CYAN}[$i] Processing...${RESET}"
      sleep $delay
    done
  done
  printf "\r${GREEN}[✔] Done!       ${RESET}\n"
}

confirm() {
  echo -e "${YELLOW}⚠️  $1${RESET}"
  read -p "   Are you sure? (y/N): " choice
  case "$choice" in
    y|Y ) return 0 ;;
    * ) echo -e "${RED}❌ Cancelled${RESET}"; return 1 ;;
  esac
}

header() {
  clear
  echo -e "${CYAN}${BOLD}==========================================================${RESET}"
  echo -e "${CYAN}${BOLD}               🧰 FLUTTER TOOLKIT v3.0               ${RESET}"
  echo -e "${CYAN}${BOLD}==========================================================${RESET}"
  echo ""
}

pause() {
  echo ""
  read -p "Press Enter to continue..."
}

# ------------------------------------------------------------------------------
# MENU UI
# ------------------------------------------------------------------------------
show_menu() {
  header
  echo -e "${BOLD}🔍 PROJECT HEALTH & MAINTENANCE${RESET}"
  echo -e "  ${CYAN}1)${RESET} 🚑 Analyze & Fix (Format, Fix, Analyze)"
  echo -e "  ${CYAN}2)${RESET} 🧹 Deep Clean Project (Delete build artifacts)"
  echo -e "  ${CYAN}3)${RESET} 🗑️ Repair Pub Cache"
  echo -e "  ${CYAN}4)${RESET} ⬆️  Upgrade Dependencies"
  echo -e "  ${CYAN}5)${RESET} 🔎 Check Outdated Packages"

  echo -e "\n${BOLD}🏗️  CODE GENERATION${RESET}"
  echo -e "  ${CYAN}6)${RESET} 🏭 Run Build Runner (One-time)"
  echo -e "  ${CYAN}7)${RESET} 👀 Watch Build Runner (Auto-update)"
  echo -e "  ${CYAN}8)${RESET} 🌍 Generate Translations (Slang)"

  echo -e "\n${BOLD}🤖 ANDROID TASKS${RESET}"
  echo -e "  ${CYAN}9)${RESET} 🐘 Gradle Clean"
  echo -e "  ${CYAN}10)${RESET} 🏗️ Gradle Assemble Release"
  echo -e "  ${CYAN}11)${RESET} 📦 Build Split APKs"
  echo -e "  ${CYAN}12)${RESET} 🚀 Build Flavor APK"

  echo -e "\n${BOLD}🍎 iOS TASKS${RESET}"
  echo -e "  ${CYAN}13)${RESET} 📥 Pod Install"
  echo -e "  ${CYAN}14)${RESET} 🔄 Pod Update"
  echo -e "  ${CYAN}15)${RESET} 🧼 Pod Clean & Reinstall"
  echo -e "  ${CYAN}16)${RESET} 📦 Build iOS Archive (.ipa)"

  echo -e "\n${BOLD}🚀 RELEASE & UTILS${RESET}"
  echo -e "  ${CYAN}17)${RESET} 🆙 Bump Version / Build Number"
  echo -e "  ${CYAN}18)${RESET} 🧪 Run Tests"
  echo -e "  ${CYAN}19)${RESET} 🩺 Flutter Doctor"
  echo -e "  ${CYAN}20)${RESET} 📂 Show Output Paths"
  echo -e "  ${CYAN}21)${RESET} 🔄 Full Project Refresh (The 'Nuclear' Option)"

  echo -e "\n${CYAN}0)${RESET} 🚪 Exit"
  echo -e "${CYAN}==========================================================${RESET}"
}

# ------------------------------------------------------------------------------
# ACTIONS
# ------------------------------------------------------------------------------

analyze_and_fix() {
  echo -e "${BLUE}🔧 Running Dart Fix...${RESET}"
  dart fix --apply & spinner

  echo -e "${BLUE}📝 Formatting Code...${RESET}"
  dart format . & spinner

  echo -e "${BLUE}🔍 Analyzing Code...${RESET}"
  dart analyze . --fatal-warnings
}

deep_clean() {
  confirm "This will delete .dart_tool, build, pubspec.lock and run flutter clean." || return
  echo -e "${YELLOW}🧹 Cleaning Flutter project...${RESET}"
  flutter clean & spinner

  echo -e "${YELLOW}🗑️  Removing artifacts...${RESET}"
  rm -rf .dart_tool build pubspec.lock

  echo -e "${BLUE}📥 Getting packages...${RESET}"
  flutter pub get & spinner
}

repair_pub_cache() {
  echo -e "${BLUE}🗑 Repairing Pub Cache (This may take a while)...${RESET}"
  dart pub cache repair & spinner
  echo -e "${BLUE}� Getting packages...${RESET}"
  flutter pub get & spinner
}

upgrade_deps() {
  echo -e "${BLUE}⬆ Updating dependencies...${RESET}"
  flutter pub upgrade & spinner
}

check_outdated() {
  echo -e "${BLUE}� Checking for outdated packages...${RESET}"
  flutter pub outdated
}

run_build_runner() {
  echo -e "${BLUE}🏭 Running build_runner build...${RESET}"
  dart run build_runner build --delete-conflicting-outputs & spinner
}

watch_build_runner() {
  echo -e "${BLUE}👀 Watching build_runner (Press Ctrl+C to stop)...${RESET}"
  dart run build_runner watch --delete-conflicting-outputs
}

generate_translations() {
  echo -e "${BLUE}🌍 Generating Slang Translations...${RESET}"
  dart run slang & spinner
}

gradle_clean() {
  echo -e "${YELLOW}� Running Gradle Clean...${RESET}"
  (cd android && ./gradlew clean) & spinner
}

gradle_assemble() {
  echo -e "${BLUE}🏗️  Running Gradle Assemble Release...${RESET}"
  (cd android && ./gradlew assembleRelease) & spinner
}

build_split_apk() {
  echo -e "${BLUE}📦 Building split APKs...${RESET}"
  flutter build apk --release --split-per-abi & spinner
  echo -e "${GREEN}✔ APKs generated at: build/app/outputs/flutter-apk/${RESET}"
}

build_flavor() {
  echo -e "Enter flavor name (e.g. dev, prod, staging): "
  read flavor
  if [ -z "$flavor" ]; then
    echo -e "${RED}❌ Flavor name cannot be empty${RESET}"
    return
  fi
  echo -e "${BLUE}� Building flavor: $flavor${RESET}"
  # Assuming standard flavor setup, adjust entry point if needed
  if [ -f "lib/main_$flavor.dart" ]; then
      flutter build apk --flavor "$flavor" -t "lib/main_$flavor.dart" & spinner
  else
      echo -e "${YELLOW}⚠️  lib/main_$flavor.dart not found, using default entry point...${RESET}"
      flutter build apk --flavor "$flavor" & spinner
  fi
}

pod_install() {
  echo -e "${BLUE}🍏 Running pod install...${RESET}"
  (cd ios && pod install) & spinner
}

pod_update() {
  echo -e "${BLUE}� Running pod update...${RESET}"
  (cd ios && pod update) & spinner
}

pod_clean_reinstall() {
  confirm "Delete Pods folder and Podfile.lock?" || return
  echo -e "${YELLOW}🧼 Cleaning iOS Pods...${RESET}"
  (cd ios && rm -rf Pods Podfile.lock && pod install) & spinner
}

build_ios_archive() {
  echo -e "${BLUE}� Building iOS Archive (.ipa)...${RESET}"
  flutter build ipa --release & spinner
}

bump_version() {
  echo -e "${YELLOW}Select bump type:${RESET}"
  echo "1) Build number (+1)"
  echo "2) Patch (x.x.+1)"
  echo "3) Minor (x.+1.x)"
  echo "4) Major (+1.x.x)"
  read bump

  case $bump in
    1) flutter pub run cider bump build ;;
    2) flutter pub run cider bump patch ;;
    3) flutter pub run cider bump minor ;;
    4) flutter pub run cider bump major ;;
    *) echo -e "${RED}❌ Invalid option${RESET}" ;;
  esac
}

run_tests() {
  echo -e "${BLUE}🧪 Running tests...${RESET}"
  flutter test
}

doctor_check() {
  flutter doctor
}

show_paths() {
  echo -e "${BLUE}📂 APK Output:${RESET} $(pwd)/build/app/outputs/flutter-apk/"
  echo -e "${BLUE}📂 IPA Output:${RESET} $(pwd)/build/ios/archive/"
}

full_refresh() {
  confirm "This is the Nuclear Option. It will clean EVERYTHING. Continue?" || return
  echo -e "${RED}☢️  Initiating Full Refresh...${RESET}"

  echo -e "${YELLOW}1/6 Cleaning Flutter...${RESET}"
  flutter clean & spinner

  echo -e "${YELLOW}2/6 Removing artifacts...${RESET}"
  rm -rf pubspec.lock .dart_tool build

  echo -e "${YELLOW}3/6 Getting packages...${RESET}"
  flutter pub get & spinner

  echo -e "${YELLOW}4/6 Fixing & Formatting...${RESET}"
  dart fix --apply & spinner
  dart format . & spinner

  echo -e "${YELLOW}5/6 Generating Code...${RESET}"
  dart run build_runner build --delete-conflicting-outputs & spinner

  echo -e "${YELLOW}6/6 Analyzing...${RESET}"
  dart analyze . --fatal-warnings

  echo -e "${GREEN}✨ Full Refresh Complete! Your project is sparkling clean.${RESET}"
}

# ------------------------------------------------------------------------------
# MAIN LOOP
# ------------------------------------------------------------------------------
while true; do
  show_menu
  read -p "Enter your choice: " choice
  echo ""

  case $choice in
    1) analyze_and_fix ;;
    2) deep_clean ;;
    3) repair_pub_cache ;;
    4) upgrade_deps ;;
    5) check_outdated ;;
    6) run_build_runner ;;
    7) watch_build_runner ;;
    8) generate_translations ;;
    9) gradle_clean ;;
    10) gradle_assemble ;;
    11) build_split_apk ;;
    12) build_flavor ;;
    13) pod_install ;;
    14) pod_update ;;
    15) pod_clean_reinstall ;;
    16) build_ios_archive ;;
    17) bump_version ;;
    18) run_tests ;;
    19) doctor_check ;;
    20) show_paths ;;
    21) full_refresh ;;
    0) echo -e "${GREEN}👋 Bye! Happy Coding!${RESET}"; exit 0 ;;
    *) echo -e "${RED}❌ Invalid Option${RESET}" ;;
  esac

  pause
done
