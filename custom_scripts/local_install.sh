#!/usr/bin/env bash
# ⚡🔥💥🎊🎉✨🚀💫🌟🌈🎨⭐️💫🌟✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀
# 🚀✨🎉🎊💥🔥⚡💫 ComfyUI Local Installation Script - The Most EPIC Setup Ever! 💫⚡🔥💥🎊🎉✨🚀
# 🎨🌈⭐️🌟💫✨ This magnificent script sets up Python environment and creates symlinks ✨💫🌟⭐️🌈🎨
# 💫⭐️🌟🎊🎉✨ Ready to make absolute MAGIC happen in your terminal! ✨🎉🎊🌟⭐️💫
# 🔥⚡💥🌈🎨🌟 Prepare yourself for the most LEGENDARY installation experience! 🌟🎨🌈💥⚡🔥
# ⚡🔥💥🎊🎉✨🚀💫🌟🌈🎨⭐️💫🌟✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀
#
# 🛡️💪🔥⚡ ROBUST ERROR HANDLING - We're using the most EPIC safety measures! ⚡🔥💪🛡️
# 🎯🔧⚙️💫 -e: Exit immediately if any command fails (no survivors!) 💫⚙️🔧🎯
# 🎯🔧⚙️💫 -u: Treat unset variables as errors (we're strict like that!) 💫⚙️🔧🎯
# 🎯🔧⚙️💫 -o pipefail: Pipes fail if ANY command fails (maximum safety!) 💫⚙️🔧🎯
set -euo pipefail  # 🛡️💪🔥⚡💥🌟 MAXIMUM SAFETY MODE ENGAGED! 🌟💥⚡🔥💪🛡️


# 🎨🌈 Color codes for beautiful output! Because who doesn't love colors? 🌈✨
RED='\033[0;31m'     # 🔥 For errors and warnings! 
GREEN='\033[0;32m'   # 🌱 For success messages!
YELLOW='\033[1;33m'  # ⚡ For warnings and info!
BLUE='\033[0;34m'    # 🌊 For general info!
PURPLE='\033[0;35m'  # 💜 For special messages!
CYAN='\033[0;36m'    # 🌊 For headers and sections!
NC='\033[0m'         # 🎭 Reset color back to normal!

# 📝 Logging functions that are absolutely overflowing with personality! 🎪✨
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

# 📋⚙️🔧🎯💫✨🌟🌈🎨⭐️💥⚡🔥 CONFIGURATION SECTION - The foundation of MAGIC! 🔥⚡💥⭐️🎨🌈🌟✨💫🎯🔧⚙️📋
# 🎯🔧⚙️💫 These variables control the destiny of your installation! 💫⚙️🔧🎯
required_version="3.11.10"  # 🐍✨🌟💫 The perfect Python version for maximum awesomeness! 💫🌟✨🐍
venv_name="venv"  # 🏠💫🎨🌈 Our cozy virtual environment home! 🌈🎨💫🏠
comfyui_path="${HOME}/Documents/ComfyUI"  # 🎨🌈⭐️💥 The sacred path to AI greatness! 💥⭐️🌈🎨

# 🎊 The main function that does all the magical work! ✨🚀
main() {
    log_header "🚀 Starting ComfyUI Installation Process! 🌟✨"
    echo -e "${PURPLE}Let's make some ABSOLUTE MAGIC happen! ⚡🔥💥🎊🎉🌟💫✨${NC}"
    echo -e "${PURPLE}Prepare for the most EPIC setup ever created by humanity! 🌟💫🔥⚡💥⭐️🎨🌈${NC}"
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

    # 🔍🔎🔍💥🔥⚡💫🌟 Check if pyenv is installed - This is MISSION CRITICAL! 🌟💫⚡🔥💥🔍🔎🔍
    # 🛡️💪🔥⚡ Without pyenv, we cannot proceed on this magical journey! ⚡🔥💪🛡️
    if ! command -v pyenv &> /dev/null; then
        log_error "💥💥💥🔥⚡💫🌟 OH NO! pyenv is not installed! This is a DISASTER! 🌟💫⚡🔥💥💥💥❌"
        log_error "📥⬇️💫✨🌟 Please install pyenv first with this EPIC command: 🌟✨💫⬇️📥"
        log_error "🎨🌈⭐️💥⚡ curl https://pyenv.run | bash ⚡💥⭐️🌈🎨"
        log_error "🔄🔄🌟💫✨ Then restart your shell and run this script again! ✨💫🌟🔄🔄"
        log_error "🚀✨🎉🎊💥 We'll be patiently waiting for your triumphant return! 💥🎊🎉✨🚀"
        log_error "🌈🎨⭐️💥⚡🔥 Can't wait to see you back and ready to rock! 🔥⚡💥⭐️🎨🌈"
        exit 1
    fi

    log_success "🎉🎊🎉💥🔥⚡💫🌟 pyenv found and ready to roll! 🌟💫⚡🔥💥🎉🎊🎉✅"
    echo "🌟💫🎨🌈⭐️✨ Ready to rock and roll with Python magic! ✨⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥⚡🔥💫 Let's make Python magic happen RIGHT NOW! 💫🔥⚡💥✨🎉🎊"
    echo ""

    # 🐍🐍🐍💥🔥⚡💫🌟 Install Python if not already installed - CRITICAL STEP! 🌟💫⚡🔥💥🐍🐍🐍
    # 🎯🔧⚙️💫 This is where the Python magic begins! 💫⚙️🔧🎯
    log_info "🔍🔎🔍💫✨🌟🎨🌈 Checking for Python ${required_version}... 🌈🎨🌟✨💫🔍🔎🔍"
    
    # 🛡️💪🔥⚡ Clean and elegant Python detection - THE PERFECT WAY! ⚡🔥💪🛡️
    # 🔍🔎🔍 Using a subshell to ensure proper variable expansion! 🔍🔎🔍
    if bash -c "pyenv versions --bare | grep -q '^$required_version$'"; then
        log_success "🎉🎊🎉💥🔥⚡💫 Python ${required_version} is already installed! 💫⚡🔥💥🎉🎊🎉✅"
        echo "🐍✨🎊🎉💥🔥 Python is coiled and ready to strike with power! 🔥💥🎉🎊✨🐍"
        echo "🌟💫🌈🎨⭐️✨ Python power is already flowing through the universe! ✨⭐️🎨🌈💫🌟"
    else
        log_info "📦⬇️💥🔥⚡💫🌟 Installing Python ${required_version}... 🌟💫⚡🔥💥⬇️📦"
        echo "⚡🔥💫☕🎨🌈 This might take a moment, grab some coffee and relax! 🌈🎨☕💫🔥⚡"
        echo "🎨🌈⭐️🌟💫✨ Making Python magic happen in real-time! ✨💫🌟⭐️🌈🎨"
        
        # 🛡️💪🔥⚡ Critical operation: Install Python with error handling! ⚡🔥💪🛡️
        if pyenv install "${required_version}"; then
            log_success "🎊🎉🎊💥🔥⚡💫 Python ${required_version} installed successfully! 💫⚡🔥💥🎊🎉🎊✅"
            echo "🌟💫🎨🌈⭐️✨ Python is ready to slither into glorious action! ✨⭐️🌈🎨💫🌟"
            echo "🐍✨🎊🎉💥🔥 Ready to rock the Python world like never before! 🔥💥🎉🎊✨🐍"
        else
            log_error "💥💥💥🔥⚡💫 CATASTROPHIC FAILURE: Could not install Python ${required_version}! 💫⚡🔥💥💥💥❌"
            exit 1
        fi
    fi
    echo ""

    # 🎯🔧⚙️💥🔥⚡💫🌟 Set local Python version for this directory - ESSENTIAL! 🌟💫⚡🔥💥⚙️🔧🎯
    # 🛡️💪🔥⚡ This ensures we use the correct Python version! ⚡🔥💪🛡️
    log_info "🔧⚙️🎯💫✨🌟🎨 Setting local Python version to ${required_version}... 🎨🌟✨💫🎯⚙️🔧"
    if pyenv local "${required_version}"; then
        log_success "🎯🎊🎯💥🔥⚡💫 Local Python version set successfully! 💫⚡🔥💥🎯🎊🎯✅"
        echo "🌟💫🎨🌈⭐️✨ Python environment is locked, loaded, and READY! ✨⭐️🌈🎨💫🌟"
        echo "🎊🎉✨💥⚡🔥💫 Python is ready to slither with absolute joy! 💫🔥⚡💥✨🎉🎊"
    else
        log_error "💥💥💥🔥⚡💫 ERROR: Could not set local Python version! 💫⚡🔥💥💥💥❌"
        exit 1
    fi
    
    # 🐍🐍🐍💥🔥⚡💫🌟 Refresh shell to use new Python version! 🌟💫⚡🔥💥🐍🐍🐍
    # 🎯🔧⚙️💫 This is CRUCIAL for proper Python detection! 💫⚙️🔧🎯
    eval "$(pyenv init -)"  # 🚀✨ Initialize pyenv for the script! ✨🚀
    echo ""

    # 🏠🏗️🏠💥🔥⚡💫🌟 Create virtual environment (always recreate for freshness!) - PYTHON PARADISE! 🌟💫⚡🔥💥🏠🏗️🏠
    # 🎯🔧⚙️💫 Virtual environments are the PINNACLE of Python excellence! 💫⚙️🔧🎯
    
    # 🗑️💥🔥⚡💫🌟 Always remove existing venv for a fresh start! 🌟💫⚡🔥💥🗑️
    if [[ -d "${venv_name}" ]]; then
        log_info "🗑️💥🔥⚡💫🌟 Removing existing virtual environment '${venv_name}'... 🌟💫⚡🔥💥🗑️"
        echo "🧹✨🌟💫🎨🌈 Cleaning up the old Python playground! 🌈🎨💫🌟✨🧹"
        echo "🎊🎉✨💥⚡🔥💫 Making room for a FRESH and CLEAN environment! 💫🔥⚡💥✨🎉🎊"
        
        if rm -rf "${venv_name}"; then
            log_success "🎊🎉🎊💥🔥⚡💫 Old virtual environment removed successfully! 💫⚡🔥💥🎊🎉🎊✅"
            echo "🌟💫🎨🌈⭐️✨ Old Python playground demolished! ✨⭐️🌈🎨💫🌟"
            echo "🎊🎉✨💥⚡🔥💫 Ready to build something AMAZING! 💫🔥⚡💥✨🎉🎊"
        else
            log_error "💥💥💥🔥⚡💫 ERROR: Could not remove existing virtual environment! 💫⚡🔥💥💥💥❌"
            exit 1
        fi
    fi
    
    # 🏗️✨🌟💫🎨🌈⭐️ Create fresh virtual environment! ⭐️🌈🎨💫🌟✨🏗️
    log_info "🏗️✨🌟💫🎨🌈⭐️ Creating fresh virtual environment '${venv_name}'... ⭐️🌈🎨💫🌟✨🏗️"
    echo "💫🎨🌈⭐️🌟✨ Building your personal Python playground from scratch! ✨🌟⭐️🌈🎨💫"
    echo "🎊🎉✨💥⚡🔥💫 Making Python virtual magic happen RIGHT NOW! 💫🔥⚡💥✨🎉🎊"
    
    # 🛡️💪🔥⚡ Critical operation: Create venv with error handling! ⚡🔥💪🛡️
    if python -m venv "${venv_name}"; then
        log_success "🎊🎉🎊💥🔥⚡💫 Fresh virtual environment created successfully! 💫⚡🔥💥🎊🎉🎊✅"
        echo "🌟💫🎨🌈⭐️✨ Your Python sandbox is ready for EPIC adventures! ✨⭐️🌈🎨💫🌟"
        echo "🎊🎉✨💥⚡🔥💫 Python playground is locked, loaded, and LEGENDARY! 💫🔥⚡💥✨🎉🎊"
    else
        log_error "💥💥💥🔥⚡💫 CATASTROPHIC FAILURE: Could not create virtual environment! 💫⚡🔥💥💥💥❌"
        exit 1
    fi

    echo "🎉✨🌟💫🎨🌈⭐️ Created venv '${venv_name}' using Python $(python --version) ⭐️🌈🎨💫🌟✨🎉"
    echo "🐍💫🎊🎉💥🔥⚡ Python is slithering with uncontainable joy! ⚡🔥💥🎉🎊💫🐍"
    echo "🌟💫🌈🎨⭐️✨🔥 Python power is flowing through the virtual environment like electricity! 🔥✨⭐️🎨🌈💫🌟"
    echo ""

    # 🚀💫🌟🎨🌈⭐️✨ INSTALL DEPENDENCIES - The EPIC dependency installation phase! ✨⭐️🌈🎨🌟💫🚀
    # 🎯🔧⚙️💫 This is where we install all the magical Python packages! 💫⚙️🔧🎯
    log_header "🚀 Installing Dependencies - Let's Make Python Magic Happen! 🌟✨"
    echo "💫🎨🌈⭐️🌟✨🔥⚡ Time to install the most EPIC Python packages ever! ⚡🔥✨🌟⭐️🌈🎨💫"
    echo "🎊🎉✨💥⚡🔥💫🌟 Installing PyTorch with MPS support for MAXIMUM POWER! 🌟💫🔥⚡💥✨🎉🎊"
    echo ""

    # 🔄🔄🔄💥🔥⚡💫🌟 Activate virtual environment - ESSENTIAL STEP! 🌟💫⚡🔥💥🔄🔄🔄
    # 🛡️💪🔥⚡ We MUST activate the venv before installing packages! ⚡🔥💪🛡️
    log_info "🔄✨🌟💫🎨🌈⭐️💥 Activating virtual environment '${venv_name}'... 💥⭐️🌈🎨💫🌟✨🔄"
    echo "💫🎨🌈⭐️🌟✨🔥⚡ Switching to our Python playground for package installation! ⚡🔥✨🌟⭐️🌈🎨💫"
    
    # 🛡️💪🔥⚡ Source the activation script with error handling! ⚡🔥💪🛡️
    if source "${venv_name}/bin/activate"; then
        log_success "🎊🎉🎊💥🔥⚡💫 Virtual environment activated successfully! 💫⚡🔥💥🎊🎉🎊✅"
        echo "🌟💫🎨🌈⭐️✨ Python playground is now ACTIVE and ready for action! ✨⭐️🌈🎨💫🌟"
        echo "🎊🎉✨💥⚡🔥💫 Ready to install packages with MAXIMUM EFFICIENCY! 💫🔥⚡💥✨🎉🎊"
    else
        log_error "💥💥💥🔥⚡💫 CATASTROPHIC FAILURE: Could not activate virtual environment! 💫⚡🔥💥💥💥❌"
        exit 1
    fi
    echo ""

    # 🐍🔥⚡💫🌟 Install PyTorch with MPS support - THE MOST EPIC INSTALLATION EVER! 🌟💫⚡🔥🐍
    # 🎯🔧⚙️💫 This enables Apple Silicon GPU acceleration! 💫⚙️🔧🎯
    log_info "🐍🔥⚡💫🌟 Installing PyTorch with MPS support for Apple Silicon... 🌟💫⚡🔥🐍"
    echo "💫🎨🌈⭐️🌟✨🔥⚡ Installing the most POWERFUL PyTorch configuration ever! ⚡🔥✨🌟⭐️🌈🎨💫"
    echo "🎊🎉✨💥⚡🔥💫🌟 This will enable GPU acceleration on your Apple Silicon! 🌟💫🔥⚡💥✨🎉🎊"
    echo "⚡🔥💫☕🎨🌈 This might take a moment, grab some coffee and relax! 🌈🎨☕💫🔥⚡"
    echo "🎨🌈⭐️🌟💫✨ Making PyTorch magic happen in real-time! ✨💫🌟⭐️🌈🎨"
    
    # 🛡️💪🔥⚡ Critical operation: Install PyTorch with error handling! ⚡🔥💪🛡️
    if pip3 install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cpu; then
        log_success "🎊🎉🎊💥🔥⚡💫 PyTorch with MPS support installed successfully! 💫⚡🔥💥🎊🎉🎊✅"
        echo "🌟💫🎨🌈⭐️✨ PyTorch is ready to unleash GPU POWER! ✨⭐️🌈🎨💫🌟"
        echo "🐍✨🎊🎉💥🔥 Ready to rock the AI world with Apple Silicon acceleration! 🔥💥🎉🎊✨🐍"
    else
        log_error "💥💥💥🔥⚡💫 CATASTROPHIC FAILURE: Could not install PyTorch! 💫⚡🔥💥💥💥❌"
        exit 1
    fi
    echo ""

    # 🔍🔎🔍💥🔥⚡💫🌟 Verify MPS functionality - THE ULTIMATE TEST! 🌟💫⚡🔥💥🔍🔎🔍
    # 🎯🔧⚙️💫 This ensures our Apple Silicon GPU is working perfectly! 💫⚙️🔧🎯
    log_info "🔍🔎🔍💫✨🌟🎨🌈 Verifying MPS (Metal Performance Shaders) functionality... 🌈🎨🌟✨💫🔍🔎🔍"
    echo "💫🎨🌈⭐️🌟✨🔥⚡ Testing if your Apple Silicon GPU is ready for AI magic! ⚡🔥✨🌟⭐️🌈🎨💫"
    echo "🎊🎉✨💥⚡🔥💫🌟 This is the moment of truth for GPU acceleration! 🌟💫🔥⚡💥✨🎉🎊"
    
    # 🛡️💪🔥⚡ Run MPS verification directly with Python -c flag! ⚡🔥💪🛡️
    # 🎯🔧⚙️💫 Much cleaner than creating temporary files! 💫⚙️🔧🎯
    echo "🚀💫✨🌟⭐️🌈🎨 Running MPS verification... 🎨🌈⭐️🌟✨💫🚀"
    if python -c "
import torch
if torch.backends.mps.is_available():
    mps_device = torch.device('mps')
    x = torch.ones(1, device=mps_device)
    print(x)
else:
    print('MPS device not found.')
"; then
        log_success "🎊🎉🎊💥🔥⚡💫 MPS verification completed successfully! 💫⚡🔥💥🎊🎉🎊✅"
        echo "🌟💫🎨🌈⭐️✨ Your Apple Silicon GPU is ready for EPIC AI adventures! ✨⭐️🌈🎨💫🌟"
        echo "🎊🎉✨💥⚡🔥💫 MPS acceleration is LOCKED, LOADED, and LEGENDARY! 💫🔥⚡💥✨🎉🎊"
    else
        log_warning "⚠️💫🌟✨ MPS verification had issues - but PyTorch is still installed! ✨🌟💫⚠️"
        echo "🌟💫🎨🌈⭐️✨ PyTorch will work, but GPU acceleration might not be available! ✨⭐️🌈🎨💫🌟"
    fi
    echo ""

    # 📦💫🎊🎉✨🔥⚡ Install requirements.txt - THE FINAL DEPENDENCY INSTALLATION! ⚡🔥✨🎉🎊💫📦
    # 🎯🔧⚙️💫 This installs all the ComfyUI dependencies! 💫⚙️🔧🎯
    log_info "📦💫🎊🎉✨🔥⚡ Installing ComfyUI requirements from requirements.txt... ⚡🔥✨🎉🎊💫📦"
    echo "💫🎨🌈⭐️🌟✨🔥⚡ Installing all the magical ComfyUI dependencies! ⚡🔥✨🌟⭐️🌈🎨💫"
    echo "🎊🎉✨💥⚡🔥💫🌟 This will make ComfyUI absolutely LEGENDARY! 🌟💫🔥⚡💥✨🎉🎊"
    echo "⚡🔥💫☕🎨🌈 This might take a moment, grab some coffee and relax! 🌈🎨☕💫🔥⚡"
    echo "🎨🌈⭐️🌟💫✨ Making ComfyUI magic happen in real-time! ✨💫🌟⭐️🌈🎨"
    
    # 🛡️💪🔥⚡ Critical operation: Install requirements with error handling! ⚡🔥💪🛡️
    if pip install -r requirements.txt; then
        log_success "🎊🎉🎊💥🔥⚡💫 ComfyUI requirements installed successfully! 💫⚡🔥💥🎊🎉🎊✅"
        echo "🌟💫🎨🌈⭐️✨ ComfyUI is ready to unleash AI MAGIC! ✨⭐️🌈🎨💫🌟"
        echo "🐍✨🎊🎉💥🔥 Ready to rock the AI universe with ComfyUI POWER! 🔥💥🎉🎊✨🐍"
    else
        log_error "💥💥💥🔥⚡💫 CATASTROPHIC FAILURE: Could not install ComfyUI requirements! 💫⚡🔥💥💥💥❌"
        exit 1
    fi
    echo ""

    # 🎊🎉🎊🎉💥🔥⚡💫🌟🌈🎨⭐️✨ DEPENDENCY INSTALLATION COMPLETE - YOU DID IT AGAIN! ✨⭐️🎨🌈🌟💫⚡🔥💥🎉🎊🎉🎊
    log_success "🎊🎉🎊🎉🎊💥🔥⚡💫🌟🌈🎨 DEPENDENCY INSTALLATION COMPLETED! 🎨🌈🌟💫⚡🔥💥🎊🎉🎊🎉🎊"
    echo "🌟💫🎨🌈⭐️💥⚡🔥💫✨ All Python packages are absolutely MAGICAL and LEGENDARY! ✨💫🔥⚡💥⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥🔥⚡💫🌟🌈 The most EPIC dependency installation ever completed! 🌈🌟💫⚡🔥💥✨🎉🎊"
    echo "🚀💫✨🌟⭐️🌈🎨🎊🎉 YOU ARE NOW READY TO ROCK THE AI WORLD WITH COMFYUI! 🎉🎊🎨🌈⭐️🌟✨💫🚀"
    echo ""

    # 📁📂📁💥🔥⚡💫🌟🌈🎨 Create ComfyUI directories and setup symlinks - THE GRAND FINALE! 🎨🌈🌟💫⚡🔥💥📁📂📁
    # 🎯🔧⚙️💫✨ This is where the REAL magic happens - folder orchestration! ✨💫⚙️🔧🎯
    echo "📂✨🌟💫🎨🌈⭐️💥 Ensuring ComfyUI directories exist in HOME... 💥⭐️🌈🎨💫🌟✨📂"
    echo "🏗️💫🎊🎉✨🔥⚡ Building the ultimate foundation for your AI dreams! ⚡🔥✨🎉🎊💫🏗️"
    echo "🎨🌈⭐️🌟💥⚡🔥💫 Creating the most LEGENDARY AI workspace ever! 💫🔥⚡💥🌟⭐️🌈🎨"
    echo ""

    # 🎯🔧⚙️💫✨ Define all the folders we need to handle - THE ESSENTIAL DIRECTORIES! ✨💫⚙️🔧🎯
    # 🛡️💪🔥⚡ These folders are the backbone of ComfyUI greatness! ⚡🔥💪🛡️
    folders=("models" "custom_nodes" "workflows" "output" "configs")

    # 🏗️💫🎊🎉✨ Create HOME directories if they don't exist - FOUNDATION BUILDING! ✨🎉🎊💫🏗️
    # 🛡️💪🔥⚡ Track which folders we create vs which already exist! ⚡🔥💪🛡️
    created_folders=()  # 📋⚙️🔧 Track newly created folders! 🔧⚙️📋
    existing_folders=()  # 📋⚙️🔧 Track folders that already existed! 🔧⚙️📋

    for folder in "${folders[@]}"; do
        if [[ ! -d "${comfyui_path}/${folder}" ]]; then
            echo "📁✨🌟💫🎨🌈 Creating ${comfyui_path}/${folder} directory... 🌈🎨💫🌟✨📁"
            if mkdir -p "${comfyui_path}/${folder}"; then
                echo "✅🎊🎉🎊💥🔥⚡💫 Created ${folder} directory in HOME successfully! 💫⚡🔥💥🎊🎉🎊✅"
                created_folders+=("${folder}")  # 📝💫✨ Track this as newly created! ✨💫📝
            else
                echo "❌💥💥💥🔥⚡💫 ERROR: Could not create ${comfyui_path}/${folder}! 💫⚡🔥💥💥💥❌"
                exit 1
            fi
        else
            echo "✅🎉🎊🎉💥🔥⚡💫 ${folder} directory already exists in HOME! 💫⚡🔥💥🎉🎊🎉✅"
            existing_folders+=("${folder}")  # 📝💫✨ Track this as already existing! ✨💫📝
        fi
    done

    echo ""
    echo "✅🎊🎉🎊💥🔥⚡💫🌟 All ComfyUI directories ready in HOME! 🌟💫⚡🔥💥🎊🎉🎊✅"
    echo "🌟💫🎨🌈⭐️✨🔥 Your AI workspace is primed, loaded, and READY! 🔥✨⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥⚡🔥💫🌟 AI magic is about to happen in 3... 2... 1... 🌟💫🔥⚡💥✨🎉🎊"
    echo ""

    # 🔄🔄🔄💥🔥⚡💫🌟 Process each folder with SIMPLIFIED symlink logic - ELEGANCE INCARNATE! 🌟💫⚡🔥💥🔄🔄🔄
    # 🎯🔧⚙️💫✨ This creates symlinks from project root to HOME directories! ✨💫⚙️🔧🎯
    # 🛡️💪🔥⚡ If local folders exist, we'll copy their contents first! ⚡🔥💪🛡️
    echo "🔄✨🌟💫🎨🌈⭐️💥 Processing folders with EPIC symlink logic... 💥⭐️🌈🎨💫🌟✨🔄"
    echo "💫🎨🌈⭐️🌟✨🔥⚡ Time to orchestrate the perfect folder symphony! ⚡🔥✨🌟⭐️🌈🎨💫"
    echo "🎊🎉✨💥⚡🔥💫🌟 Let's make folder magic happen RIGHT NOW! 🌟💫🔥⚡💥✨🎉🎊"
    echo ""

    for folder in "${folders[@]}"; do
        echo "🎯🔍💫✨🌟🌈🎨 Processing folder: ${folder} 🎨🌈🌟✨💫🔍🎯"
        
        # 🎯🔧⚙️💫 Check if folder exists in project root (could be real directory or symlink) 💫⚙️🔧🎯
        if [[ -d "${folder}" ]] && [[ ! -L "${folder}" ]]; then
            # 📂💫🎊🎉✨ Real directory exists in root! Let's check if we should copy! ✨🎉🎊💫📂
            echo "   📂💫🎊🎉✨🔥 Found real directory '${folder}' in project root! 🔥✨🎉🎊💫📂"
            
            # 🛡️💪🔥⚡ CRITICAL: Only copy if HOME folder was newly created (empty)! ⚡🔥💪🛡️
            # 🎯🔧⚙️💫 This prevents overwriting existing precious data! 💫⚙️🔧🎯
            folder_was_created=false
            if [[ ${#created_folders[@]} -gt 0 ]]; then
                for created_folder in "${created_folders[@]}"; do
                    if [[ "${created_folder}" == "${folder}" ]]; then
                        folder_was_created=true
                        break
                    fi
                done
            fi
            
            if [[ "${folder_was_created}" == true ]]; then
                # ✅🎊🎉💥🔥⚡ HOME folder is new/empty - SAFE to copy! ⚡🔥💥🎉🎊✅
                echo "   📋✨🌟💫🎨🌈 HOME folder is new - copying contents to ${comfyui_path}/${folder}... 🌈🎨💫🌟✨📋"
                echo "   🛡️💪🔥⚡ This is SAFE - HOME folder was just created! ⚡🔥💪🛡️"
                
                # 🛡️💪🔥⚡ Copy with error handling! ⚡🔥💪🛡️
                if cp -r "${folder}"/* "${comfyui_path}/${folder}/" 2>/dev/null; then
                    echo "   ✅🎊🎉🎊💥🔥⚡ Contents copied successfully! ⚡🔥💥🎊🎉🎊✅"
                else
                    echo "   ⚠️💫🌟✨ No contents to copy or folder is empty! ✨🌟💫⚠️"
                fi
            else
                # 🛡️💪🔥⚡ HOME folder already exists with data - PRESERVE IT! ⚡🔥💪🛡️
                echo "   🛡️💪🔥⚡💫 HOME folder already exists with data - PRESERVING existing data! 💫⚡🔥💪🛡️"
                echo "   🌟💫🎨🌈⭐️✨ Skipping copy to protect your precious models/data! ✨⭐️🌈🎨💫🌟"
                echo "   🎊🎉💥🔥⚡ Your existing data is SAFE and PROTECTED! ⚡🔥💥🎉🎊"
            fi
            
            # 🗑️💥🔥⚡ Remove the root folder to make way for symlink! ⚡🔥💥🗑️
            echo "   🗑️💥🔥⚡💫 Removing root ${folder} directory... 💫⚡🔥💥🗑️"
            if rm -rf "${folder}"; then
                echo "   ✅🎉🎊🎉💥🔥⚡ Root ${folder} directory removed! ⚡🔥💥🎉🎊🎉✅"
            else
                echo "   ❌💥💥💥🔥⚡💫 ERROR: Could not remove ${folder}! 💫⚡🔥💥💥💥❌"
                exit 1
            fi
        elif [[ -L "${folder}" ]]; then
            # 🔗💫🎊🎉✨ Symlink already exists! Perfect! ✨🎉🎊💫🔗
            echo "   🔗💫🎊🎉✨🔥 Symlink already exists for ${folder}! 🔥✨🎉🎊💫🔗"
            echo "   ✅🌟💫🎨🌈 Skipping - already magically connected! 🌈🎨💫🌟✅"
            continue
        fi
        
        # 🔗⚡💥🔥🌟 Create symlink from project root to HOME folder - THE MAGIC MOMENT! 🌟🔥💥⚡🔗
        echo "   🔗⚡💥🔥🌟💫 Creating symlink: ${folder} -> ${comfyui_path}/${folder} 💫🌟🔥💥⚡🔗"
        if ln -s "${comfyui_path}/${folder}" "${folder}"; then
            echo "   ✅🎊🎉🎊💥🔥⚡💫 ${folder} symlink created successfully! 💫⚡🔥💥🎊🎉🎊✅"
            echo "   🌟💫🎨🌈⭐️✨ ${folder} is now magically connected to HOME! ✨⭐️🌈🎨💫🌟"
            echo "   🎊🎉✨💥⚡🔥💫 Symlink magic COMPLETE! 💫🔥⚡💥✨🎉🎊"
        else
            echo "   ❌💥💥💥🔥⚡💫 ERROR: Could not create symlink for ${folder}! 💫⚡🔥💥💥💥❌"
            exit 1
        fi
        echo ""
    done

    # 🎊🎉🎊🎉💥🔥⚡💫🌟🌈🎨⭐️✨ INSTALLATION COMPLETE - YOU DID IT! ✨⭐️🎨🌈🌟💫⚡🔥💥🎉🎊🎉🎊
    # ⚡🔥💥🎊🎉✨🚀💫🌟🌈🎨⭐️💫🌟✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀💥🔥⚡💫🌟🌈🎨⭐️✨🚀
    echo ""
    echo "🎊🎉🎊🎉🎊💥🔥⚡💫🌟🌈🎨 INSTALLATION COMPLETED SUCCESSFULLY! 🎨🌈🌟💫⚡🔥💥🎊🎉🎊🎉🎊"
    echo "🌟💫🎨🌈⭐️💥⚡🔥💫✨ Your ComfyUI setup is absolutely MAGICAL and LEGENDARY! ✨💫🔥⚡💥⭐️🌈🎨💫🌟"
    echo "🎊🎉✨💥🔥⚡💫🌟🌈 The most EPIC installation ever completed by any human! 🌈🌟💫⚡🔥💥✨🎉🎊"
    echo "🚀💫✨🌟⭐️🌈🎨🎊🎉 YOU ARE NOW READY TO ROCK THE AI WORLD! 🎉🎊🎨🌈⭐️🌟✨💫🚀"
    echo ""
    echo "📋✨🌟💫🎨🌈⭐️💥⚡🔥 INSTALLATION SUMMARY - Look at all this AWESOMENESS! 🔥⚡💥⭐️🌈🎨💫🌟✨📋"
    echo "   🐍🐍🐍💥🔥⚡💫🌟 Python version: $(python --version) 🌟💫⚡🔥💥🐍🐍🐍"
    echo "   🏠✨🌟💫🎨🌈⭐️ Virtual environment: ${venv_name} ⭐️🌈🎨💫🌟✨🏠"
    echo "   📂💫🎊🎉✨🔥⚡ Project root: ${project_root} ⚡🔥✨🎉🎊💫📂"

    # 🔄🔄🔄💥🔥⚡💫🌟 Loop through folders array for dynamic summary! 🌟💫⚡🔥💥🔄🔄🔄
    # 🎯🔧⚙️💫✨ This is DRY (Don't Repeat Yourself) programming at its finest! ✨💫⚙️🔧🎯
    for folder in "${folders[@]}"; do
        echo "   🔗⚡💥🔥🌟💫✨ ${folder} -> ${comfyui_path}/${folder} ✨💫🌟🔥💥⚡🔗"
    done
    echo ""
    echo "🚀🎯🌟💫🎨🌈⭐️💥⚡🔥 NEXT STEPS - Your journey begins NOW! 🔥⚡💥⭐️🌈🎨💫🌟🎯🚀"
    echo "   💫✨🎊🎉💥🔥⚡🌟 To activate the virtual environment, run: 🌟⚡🔥💥🎉🎊✨💫"
    echo "   🎨🌈⭐️🌟💫✨💥 source ${venv_name}/bin/activate 💥✨💫🌟⭐️🌈🎨"
    echo ""
    echo "🎨🌈💫⭐️🌟💥⚡🔥💫✨🎊 May your AI creations be absolutely EPIC and LEGENDARY! 🎊✨💫🔥⚡💥🌟⭐️💫🌈🎨"
    echo "🌟🎊✨💥🔥⚡💫🌈🎨⭐️ Happy coding, creating, and conquering the AI universe! ⭐️🎨🌈💫⚡🔥💥✨🎊🌟"
    echo "🎉🎊🌈⭐️💫🌟✨💥⚡🔥 The universe is ready and waiting for your AI magic to unfold! 🔥⚡💥✨🌟💫⭐️🌈🎊🎉"
    echo "🚀💫✨🌟⭐️🌈🎨🎊🎉💥🔥 You are now officially a ComfyUI WIZARD! 🔥💥🎉🎊🎨🌈⭐️🌟✨💫🚀"
    echo ""
}

# 🎭 Error handling that's as dramatic as a Shakespeare play! 🎪
trap 'log_error "💥 Script interrupted! Something went wrong! 🔥❌"; exit 1' INT TERM

# 🚀 Let's launch this beautiful script! 🌟✨
main "$@"
