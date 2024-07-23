# debian-packaging

This project provides tools and scripts for Debian package creation and management. It leverages `sbuild` for efficient package building.

**Project Structure:**
* **sbuild:** Contains scripts and tools for managing the sbuild environment.

**Prerequisites:**
* A Debian-based system with `sudo` access.
* Git (for cloning the repository)

**Usage:**

1. **Clone the repository:**
   ```bash
   git clone <repository_url>
   ```
2. **Navigate to the project directory:**
   ```bash
   cd debian-packaging
   ```
3. **Run the setup script:**
   ```bash
   ./sbuild/sbuild_helper.sh
   ```

This will set up the necessary environment for building Debian packages using `sbuild`.

**Additional Notes:**
* The `sbuild` directory contains scripts for managing the sbuild environment and creating chroot environments.
* This project is under development and may contain additional tools and scripts in the future.

**Contributing:**
Feel free to contribute to this project by submitting issues or pull requests.

**License:**
MIT License.

## Getting Started with Debian Packaging:
* Refer to the Debian Packaging Manual: [https://www.debian.org/doc/manuals/maint-guide/index.html](https://www.debian.org/doc/manuals/maint-guide/index.html)

## References
* This resource helped to quickly get an sbuild environment up and going: [zigo's wiki](https://wiki.debian.org/zigo/mysbuild)
* [Official Debian SBuild Docs](https://wiki.debian.org/sbuild)

## Future Enhancements:
* Incorporate more advanced sbuild features.
* Add support for multiple sbuild setup methods.
* [Later] Add support for setups other than sbuild.
* Implement automated testing and CI pipelines.
