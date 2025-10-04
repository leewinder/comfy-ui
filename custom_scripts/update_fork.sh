#!/usr/bin/env bash
# ⚡🔥💥🎊🎉✨🚀💫🌟🌈🎨⭐️💫🌟✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀
# 🚀✨🎉🎊💥🔥⚡💫 ComfyUI Fork Update Script - The Most EPIC Fork Sync Ever! 💫⚡🔥💥🎊🎉✨🚀
# 🎨🌈⭐️🌟💫✨ This magnificent script syncs your fork with upstream changes! ✨💫🌟⭐️🌈🎨
# 💫⭐️🌟🎊🎉✨ Ready to make absolute MAGIC happen in your git repository! ✨🎉🎊🌟⭐️💫
# 🔥⚡💥🌈🎨🌟 Prepare yourself for the most LEGENDARY fork update experience! 🌟🎨🌈💥⚡🔥
# ⚡🔥💥🎊🎉✨🚀💫🌟🌈🎨⭐️💫🌟✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀

# 🛡️💪🔥⚡ ROBUST ERROR HANDLING - We're using the most EPIC safety measures! ⚡🔥💪🛡️
# 🎯🔧⚙️💫 -e: Exit immediately if any command fails (no survivors!) 💫⚙️🔧🎯
# 🎯🔧⚙️💫 -u: Treat unset variables as errors (we're strict like that!) 💫⚙️🔧🎯
# 🎯🔧⚙️💫 -o pipefail: Pipes fail if ANY command fails (maximum safety!) 💫⚙️🔧🎯
set -euo pipefail  # 🛡️💪🔥⚡💥🌟 MAXIMUM SAFETY MODE ENGAGED! 🌟💥⚡🔥💪🛡️

# 📋⚙️🔧🎯💫✨🌟🌈🎨⭐️💥⚡🔥 CONFIGURATION SECTION - The foundation of MAGIC! 🔥⚡💥⭐️🎨🌈🌟✨💫🎯🔧⚙️📋
# 🎯🔧⚙️💫 These variables control the destiny of your fork synchronization! 💫⚙️🔧🎯
my_branch="master"        # 🌟💫🎨🌈 Your fork's main branch name! 🌈🎨💫🌟
upstream_branch="master"  # 🚀✨🎊🎉 The upstream repository's main branch name! 🎉🎊✨🚀

# 🎨🌈 Color codes for beautiful output! Because who doesn't love colors? 🌈✨
# 🌟💫🎨🌈⭐️ These colors will make your terminal absolutely MAGICAL! ⭐️🌈🎨💫🌟
RED='\033[0;31m'     # 🔥 For errors and warnings! Fire and passion! 🔥💥
GREEN='\033[0;32m'   # 🌱 For success messages! Growth and prosperity! 🌿✨
YELLOW='\033[1;33m'  # ⚡ For warnings and info! Lightning and energy! ⚡🌟
BLUE='\033[0;34m'    # 🌊 For general info! Water and flow! 💧🌊
PURPLE='\033[0;35m'  # 💜 For special messages! Royalty and magic! 👑✨
CYAN='\033[0;36m'    # 🌊 For headers and sections! Ocean and depth! 🌊💫
NC='\033[0m'         # 🎭 Reset color back to normal! The curtain falls! 🎭✨

# 📝 Logging functions that are absolutely overflowing with personality! 🎪✨
# 🌟💫🎨🌈 These functions will make your output absolutely MAGICAL! 🌈🎨💫🌟
log_info() {
    echo -e "${BLUE}ℹ️  INFO:${NC} $1"  # 🌊 Because information is like water - essential! 💧
}

log_success() {
    echo -e "${GREEN}✅ SUCCESS:${NC} $1"  # 🌱 Success makes everything grow! 🌿
}

log_warning() {
    echo -e "${YELLOW}⚠️  WARNING:${NC} $1"  # ⚡ Warnings are like lightning - bright and attention-grabbing! ⚡
}

log_error() {
    echo -e "${RED}❌ ERROR:${NC} $1"  # 🔥 Errors are hot and need immediate attention! 🔥
}

log_header() {
    echo -e "${CYAN}🎯 $1${NC}"  # 🌊 Headers are like the ocean - deep and important! 🌊
}

# 🎊 The main function that does all the magical work! ✨🚀
main() {
    log_header "🚀 Starting ComfyUI Fork Update Process! 🌟✨"
    echo -e "${PURPLE}This script will update your fork with the latest upstream changes! 🎨💫${NC}"
    echo ""
    
    # 🎯 Step 1: Check if we're in a git repository! 🏠✨
    # 🌟💫🎨🌈 This is CRITICAL for making the script work properly! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ Without git, we cannot proceed on this magical journey! ⚡🔥💪🛡️
    log_info "🔍 Checking if we're in a git repository... 🏠"
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        log_error "💥💥💥🔥⚡ We're not in a git repository! This is a DISASTER! ⚡🔥💥💥💥❌"
        log_error "🏠❌ Please run this script from your ComfyUI fork directory! 🏠❌"
        log_error "🔄🔄🌟💫✨ Make sure you're in the right place and try again! ✨💫🌟🔄🔄"
        exit 1
    fi
    log_success "🎉🎊🎉 We're in a git repository! Git is our friend! 🐙✨"
    echo "🌟💫🎨🌈⭐️✨ Ready to rock and roll with git magic! ✨⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥⚡🔥💫 Let's make git magic happen RIGHT NOW! 💫🔥⚡💥✨🎉🎊"
    echo ""

    # 🎯🔧⚙️💫✨ Detect if we're running from custom_scripts or root directory! ✨💫⚙️🔧🎯
    # 🌟💫🎨🌈 This is CRITICAL for making the script work from anywhere! 🌈🎨💫🌟
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"  # 📁💥🔥⚡ Get absolute script directory! ⚡🔥💥📁
    if [[ "$(basename "${script_dir}")" == "custom_scripts" ]]; then
        # 🎊🎉💥🔥⚡ We're in custom_scripts! Moving up one level to root! ⚡🔥💥🎉🎊
        project_root="$(dirname "${script_dir}")"
        log_info "🎯💫✨🌟 Detected script running from custom_scripts folder! 🌟✨💫🎯"
    else
        # 🎊🎉💥🔥⚡ We're already in root! Perfect! ⚡🔥💥🎉🎊
        project_root="${script_dir}"
        log_info "🎯💫✨🌟 Detected script running from project root! 🌟✨💫🎯"
    fi

    # 🔧⚙️🎯💫✨ Change to project root for consistency! ✨💫🎯⚙️🔧
    cd "${project_root}" || {
        log_error "💥💥💥🔥⚡ CATASTROPHIC ERROR: Cannot change to project root directory! ⚡🔥💥💥💥❌"
        log_error "🌈🎨⭐️💥⚡ Project root path: ${project_root} ⚡💥⭐️🎨🌈"
        exit 1
    }
    log_success "🎊🎉💥🔥⚡ Now operating from: ${project_root} ⚡🔥💥🎉🎊✅"
    echo ""
    
    # 🎯 Step 2: Check if we're on the main branch! 🌟
    # 🌟💫🎨🌈 This is ESSENTIAL for proper fork synchronization! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ We need to be on main to perform the rebase magic! ⚡🔥💪🛡️
    log_info "🌿 Checking current branch... 🎯"
    current_branch=$(git branch --show-current)
    log_info "📍 Currently on branch: ${current_branch} 🎯"
    
    if [ "$current_branch" != "$my_branch" ]; then
        log_error "💥💥💥🔥⚡ This script should only be run on the ${my_branch} branch! ⚡🔥💥💥💥❌"
        log_error "🎯❌ You're currently on: ${current_branch} 🎯❌"
        log_error "🔄🔄🌟💫✨ Please switch to ${my_branch} branch first: git checkout ${my_branch} 🔄🔄"
        log_error "🚀✨🎉🎊💥 We'll be patiently waiting for your triumphant return! 💥🎊🎉✨🚀"
        exit 1
    fi
    log_success "🎉🎊🎉 We're on the ${my_branch} branch! Perfect! 🌟✨"
    echo "🌟💫🎨🌈⭐️✨ ${my_branch} branch is locked, loaded, and READY! ✨⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥⚡🔥💫 Branch magic is flowing through the universe! 💫🔥⚡💥✨🎉🎊"
    echo ""

    # 🎯 Step 2.5: Delete symlinks! 🔗
    # 🌟💫🎨🌈 This removes symlinks to avoid Git confusion! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ Simple step: just delete them! ⚡🔥💪🛡️
    log_info "🔗 Deleting symlinks for clean Git operations... 🛡️"
    
    # Store symlink information before removing them
    # 🎯🔧⚙️💫 Dynamically detect ALL symlinks in root directory! 💫⚙️🔧🎯
    symlinks_info=()
    for item in *; do
        # Skip if it's not a symlink or if it's a file (not directory)
        if [[ -L "$item" ]] && [[ -d "$item" ]]; then
            target=$(readlink "$item")
            symlinks_info+=("$item|$target")
            log_info "🔗 Found symlink directory: $item -> $target 🎯"
        fi
    done
    
    # Remove symlinks
    if [ ${#symlinks_info[@]} -gt 0 ]; then
        log_info "🗑️ Removing symlinks... 🛡️"
        for symlink_info in "${symlinks_info[@]}"; do
            symlink_name="${symlink_info%|*}"
            rm "$symlink_name"
            echo "   🗑️ Removed symlink: $symlink_name"
        done
    else
        log_info "✅ No symlinks found! 🛡️"
    fi
    echo ""
    
    # 🎯 Step 2.6: Stash changes! 📦
    # 🌟💫🎨🌈 This stashes all changes safely! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ Simple step: just stash! ⚡🔥💪🛡️
    log_info "📦 Stashing all changes... 🛡️"
    
    # Stash everything (no symlinks to confuse Git!)
    if git stash push --include-untracked -m "Auto-stash all changes before fork update"; then
        log_success "🎊🎉🎊💥🔥⚡💫 Changes stashed successfully! 💫⚡🔥💥🎊🎉🎊✅"
        echo "🌟💫🎨🌈⭐️✨ Your changes are safely stored! ✨⭐️🌈🎨💫🌟"
        stash_created=true
    else
        log_success "🎊🎉🎊💥🔥⚡💫 No changes to stash! 💫⚡🔥💥🎊🎉🎊✅"
        echo "🌟💫🎨🌈⭐️✨ Working directory was already clean! ✨⭐️🌈🎨💫🌟"
        stash_created=false
    fi
    echo ""
    
    # 🎯 Step 3: Check if upstream remote exists, add if not! 🔗
    # 🌟💫🎨🌈 This is where we connect to the source of all magic! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ Upstream remote is our gateway to the original repository! ⚡🔥💪🛡️
    log_info "🔗 Checking for upstream remote... 🌐"
    if ! git remote get-url upstream > /dev/null 2>&1; then
        log_info "➕ Adding upstream remote... 🚀"
        git remote add upstream git@github.com:comfyanonymous/ComfyUI.git
        log_success "🎉🎊🎉 Upstream remote added! We're now connected to the source! 🌟"
        echo "🌟💫🎨🌈⭐️✨ Connection established! The magic bridge is built! ✨⭐️🌈🎨💫🌟"
        echo "🎊🎉✨💥⚡🔥💫 Upstream power is flowing through the connection! 💫🔥⚡💥✨🎉🎊"
    else
        upstream_url=$(git remote get-url upstream)
        log_info "📍 Upstream remote already exists: ${upstream_url} 🌐"
        
        # 🔄 Update the upstream URL just in case it changed! 
        # 🌟💫🎨🌈 Fresh connections are always better! 🌈🎨💫🌟
        log_info "🔄 Updating upstream remote URL... 🔄"
        git remote set-url upstream git@github.com:comfyanonymous/ComfyUI.git
        log_success "🎉🎊🎉 Upstream remote URL updated! Fresh connection! 🌟"
        echo "🌟💫🎨🌈⭐️✨ Connection refreshed! The bridge is stronger than ever! ✨⭐️🌈🎨💫🌟"
        echo "🎊🎉✨💥⚡🔥💫 Fresh upstream power is flowing through the universe! 💫🔥⚡💥✨🎉🎊"
    fi
    echo ""
    
    # 🎯 Step 4: Fetch the latest changes from upstream! 📥
    # 🌟💫🎨🌈 This is where we download all the fresh magic! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ Fetching brings us the latest and greatest changes! ⚡🔥💪🛡️
    log_info "📥 Fetching latest changes from upstream ${upstream_branch} branch... 🚀"
    if ! git fetch upstream "${upstream_branch}"; then
        log_error "💥💥💥🔥⚡ Failed to fetch from upstream! This is a DISASTER! ⚡🔥💥💥💥❌"
        log_error "🌐❌ Check your network connection and SSH keys! 🌐❌"
        log_error "🔄🔄🌟💫✨ Make sure everything is connected and try again! ✨💫🌟🔄🔄"
        log_error "🚀✨🎉🎊💥 We'll be patiently waiting for your triumphant return! 💥🎊🎉✨🚀"
        exit 1
    fi
    log_success "🎉🎊🎉 Successfully fetched latest changes from upstream! Fresh data incoming! 📥✨"
    echo "🌟💫🎨🌈⭐️✨ Fresh upstream data is flowing through the universe! ✨⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥⚡🔥💫 The latest magic has been downloaded successfully! 💫🔥⚡💥✨🎉🎊"
    echo ""
    
    # 🎯 Step 5: Check if there are any changes to rebase! 🔍
    # 🌟💫🎨🌈 This is where we check if rebasing is actually needed! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ No point in rebasing if we're already up to date! ⚡🔥💪🛡️
    log_info "🔍 Checking if there are changes to rebase... 🎯"
    if git diff --quiet HEAD "upstream/${upstream_branch}"; then
        log_success "🎉🎊🎉 Your branch is already up to date with upstream! No rebasing needed! 🌟✨"
        log_info "🏁🎊 Nothing to do! Your fork is perfectly synchronized! 🎊"
        echo "🌟💫🎨🌈⭐️✨ Your fork is already in perfect harmony with upstream! ✨⭐️🌈🎨💫🌟"
        echo "🎊🎉✨💥⚡🔥💫 Synchronization magic is already complete! 💫🔥⚡💥✨🎉🎊"
        exit 0
    fi
    echo ""
    
    # 🎯 Step 6: Perform the rebase! This is where the magic happens! ✨
    # 🌟💫🎨🌈 This is the MOST EPIC part of the entire process! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ Rebase magic will put your changes on top of upstream! ⚡🔥💪🛡️
    log_info "🎭 Starting rebase process... This is where the magic happens! ✨"
    log_warning "⚠️  This will rebase upstream/${upstream_branch} into your ${my_branch} branch! 🎯"
    echo "🌟💫🎨🌈⭐️✨ Prepare for the most LEGENDARY rebase ever! ✨⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥⚡🔥💫 Rebase magic is about to unfold! 💫🔥⚡💥✨🎉🎊"
    
    if ! git rebase "upstream/${upstream_branch}"; then
        log_error "💥💥💥🔥⚡ Rebase failed! There might be conflicts or other issues! ⚡🔥💥💥💥❌"
        log_error "🛠️  Please resolve any conflicts manually and then run: git rebase --continue 🛠️"
        log_error "🔄 Or abort the rebase with: git rebase --abort 🔄"
        log_error "🚀✨🎉🎊💥 We'll be patiently waiting for your triumphant return! 💥🎊🎉✨🚀"
        exit 1
    fi
    log_success "🎉🎊🎉 Rebase completed successfully! Your changes are now on top of upstream! 🌟✨"
    echo "🌟💫🎨🌈⭐️✨ Rebase magic has been completed with EPIC success! ✨⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥⚡🔥💫 Your changes are now beautifully sitting on top! 💫🔥⚡💥✨🎉🎊"
    echo ""
    
    # 🎯 Step 7: Commit with the specified message! 📝
    # 🌟💫🎨🌈 This is where we immortalize our rebase magic! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ Commits are like snapshots of our magical journey! ⚡🔥💪🛡️
    log_info "📝 Committing changes with message: 'Rebasing against upstream' 📝"
    if ! git commit --allow-empty -m "Rebasing against upstream"; then
        log_warning "⚠️  No changes to commit, or commit already exists! 📝"
        echo "🌟💫🎨🌈⭐️✨ No commit needed - everything is already perfect! ✨⭐️🌈🎨💫🌟"
    else
        log_success "🎉🎊🎉 Changes committed successfully! Your commit is ready! 📝✨"
        echo "🌟💫🎨🌈⭐️✨ Commit magic has been immortalized in git history! ✨⭐️🌈🎨💫🌟"
        echo "🎊🎉✨💥⚡🔥💫 Your rebase commit is now part of the universe! 💫🔥⚡💥✨🎉🎊"
    fi
    echo ""
    
    # 🎯 Step 8: Force push to your main branch! 💪
    # 🌟💫🎨🌈 This is where we share our magic with the world! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ Force push will update your remote fork with EPIC power! ⚡🔥💪🛡️
    log_info "💪 Force pushing to your ${my_branch} branch... This will update your remote! 🚀"
    log_warning "⚠️  Using --force to overwrite remote history! 💪"
    echo "🌟💫🎨🌈⭐️✨ Prepare for the most LEGENDARY force push ever! ✨⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥⚡🔥💫 Force push magic is about to conquer the remote! 💫🔥⚡💥✨🎉🎊"
    
    if ! git push --force origin "${my_branch}"; then
        log_error "💥💥💥🔥⚡ Failed to push to origin! This is a DISASTER! ⚡🔥💥💥💥❌"
        log_error "🌐❌ Check your permissions and network! 🌐❌"
        log_error "🔄🔄🌟💫✨ Make sure everything is connected and try again! ✨💫🌟🔄🔄"
        log_error "🚀✨🎉🎊💥 We'll be patiently waiting for your triumphant return! 💥🎊🎉✨🚀"
        exit 1
    fi
    log_success "🎉🎊🎉 Successfully force pushed to origin ${my_branch}! Your fork is now updated! 🌟✨"
    echo "🌟💫🎨🌈⭐️✨ Force push magic has conquered the remote! ✨⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥⚡🔥💫 Your fork is now updated and ready for action! 💫🔥⚡💥✨🎉🎊"
    echo ""

    # 🎯 Step 9: Restore stashed files FIRST, then recreate symlinks! 📦
    # 🌟💫🎨🌈 This brings back your changes and symlinks safely! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ Restoring everything we temporarily removed! ⚡🔥💪🛡️
    
    # 📦💫🎨🌈⭐️ FIRST: Pop the stash! ⭐️🌈🎨💫📦
    # 🛡️💪🔥⚡ Check if there's a stash and pop it! ⚡🔥💪🛡️
    if git stash list | grep -q "Auto-stash all changes before fork update"; then
        log_info "📦 Restoring your stashed files FIRST... 🛡️"
        echo "💫🎨🌈⭐️🌟✨ Bringing back your changes safely! ✨🌟⭐️🌈🎨💫"
        
        # 🛡️💪🔥⚡ Pop the stash with error handling! ⚡🔥💪🛡️
        if git stash pop; then
            log_success "🎊🎉🎊💥🔥⚡💫 Files restored successfully! 💫⚡🔥💥🎊🎉🎊✅"
            echo "🌟💫🎨🌈⭐️✨ Your changes are back and ready for action! ✨⭐️🌈🎨💫🌟"
            echo "🎊🎉✨💥⚡🔥💫 Everything is exactly as you left it! 💫🔥⚡💥✨🎉🎊"
        else
            log_warning "⚠️💫🌟✨ Could not automatically restore stashed files! ✨🌟💫⚠️"
            echo "🌟💫🎨🌈⭐️✨ You may need to manually restore them with: git stash pop ✨⭐️🌈🎨💫🌟"
            echo "🎊🎉✨💥⚡🔥💫 Check 'git stash list' to see your stashed changes! 💫🔥⚡💥✨🎉🎊"
        fi
        echo ""
    else
        log_info "📦 No stash found to restore! 🛡️"
        echo "🌟💫🎨🌈⭐️✨ No stashed changes to bring back! ✨⭐️🌈🎨💫🌟"
        echo ""
    fi
    
    # 🔗💫🎨🌈⭐️ THEN: Recreate symlinks and DELETE any directories that came back! ⭐️🌈🎨💫🔗
    # 🎯🔧⚙️💫 This happens after stashed files are restored! 💫⚙️🔧🎯
    if [ ${#symlinks_info[@]} -gt 0 ]; then
        log_info "🔗 Recreating symlinks and cleaning up any directories that came back... 🛡️"
        for symlink_info in "${symlinks_info[@]}"; do
            symlink_name="${symlink_info%|*}"
            symlink_target="${symlink_info#*|}"
            # Remove any existing directory/symlink first (this deletes directories that came back from stash)
            rm -rf "$symlink_name" 2>/dev/null || true
            ln -s "$symlink_target" "$symlink_name"
            echo "   🔗 Recreated symlink: $symlink_name -> $symlink_target"
        done
        log_success "🎊🎉🎊💥🔥⚡💫 All symlinks restored successfully! 💫⚡🔥💥🎊🎉🎊✅"
        echo "🌟💫🎨🌈⭐️✨ Symlinked directories are back to their original state! ✨⭐️🌈🎨💫🌟"
        echo ""
    fi
    
    # 🎊 Final success message! 🎉
    # 🌟💫🎨🌈 This is the GRAND FINALE of our EPIC journey! 🌈🎨💫🌟
    # 🛡️💪🔥⚡ Time to celebrate our magnificent achievement! ⚡🔥💪🛡️
    echo ""
    log_header "🎊 Fork Update Complete! 🎉✨"
    echo -e "${GREEN}🌟 Your ComfyUI fork has been successfully updated with the latest upstream changes! 🌟${NC}"
    echo -e "${PURPLE}🎨 Your local changes are now beautifully sitting on top of the latest upstream code! 🎨${NC}"
    echo -e "${CYAN}🚀 Your remote fork has been updated and is ready for action! 🚀${NC}"
    echo ""
    log_success "🎯 Mission accomplished! Your fork is now perfectly synchronized! 🎯✨"
    echo "🌟💫🎨🌈⭐️✨ The most EPIC fork update ever completed by any human! ✨⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥⚡🔥💫 Your fork synchronization journey is LEGENDARY! 💫🔥⚡💥✨🎉🎊"
    echo "🚀💫✨🌟⭐️🌈🎨🎊🎉 YOU ARE NOW READY TO ROCK THE FORK WORLD! 🎉🎊🎨🌈⭐️🌟✨💫🚀"
    echo ""
    echo "🎨🌈💫⭐️🌟💥⚡🔥💫✨🎊 May your fork updates be absolutely EPIC and LEGENDARY! 🎊✨💫🔥⚡💥🌟⭐️💫🌈🎨"
    echo "🌟🎊✨💥🔥⚡💫🌈🎨⭐️ Happy forking, syncing, and conquering the git universe! ⭐️🎨🌈💫⚡🔥💥✨🎊🌟"
    echo "🎉🎊🌈⭐️💫🌟✨💥⚡🔥 The universe is ready and waiting for your fork magic to unfold! 🔥⚡💥✨🌟💫⭐️🌈🎊🎉"
    echo "🚀💫✨🌟⭐️🌈🎨🎊🎉💥🔥 You are now officially a FORK UPDATE WIZARD! 🔥💥🎉🎊🎨🌈⭐️🌟✨💫🚀"
    echo ""
    
    # 🛡️💪🔥⚡ CRITICAL: Ensure we're in a safe directory before script exits! ⚡🔥💪🛡️
    # 🎯🔧⚙️💫 This prevents shell directory confusion after symlink operations! 💫⚙️🔧🎯
    log_info "🛡️ Ensuring safe directory state before script completion... 🛡️"
    if ! cd "${project_root}" 2>/dev/null; then
        # If project_root is not accessible, go to HOME as fallback
        cd "${HOME}" 2>/dev/null || true
    fi
    log_success "🎊🎉🎊💥🔥⚡💫 Safe directory state restored! 💫⚡🔥💥🎊🎉🎊✅"
}

# 🎭 Error handling that's as dramatic as a Shakespeare play! 🎪
# 🛡️💪🔥⚡ CRITICAL: Always ensure safe directory state on script exit! ⚡🔥💪🛡️
cleanup_and_exit() {
    log_error "💥 Script interrupted! Something went wrong! 🔥❌"
    # Ensure we're in a safe directory before exiting
    if ! cd "${project_root:-${HOME}}" 2>/dev/null; then
        cd "${HOME}" 2>/dev/null || true
    fi
    exit 1
}
trap cleanup_and_exit INT TERM

# 🚀 Let's launch this beautiful script! 🌟✨
main "$@"
