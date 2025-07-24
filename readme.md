## Android Malware Analysis with Gemini CLI AI

This repository provides a robust framework designed for performing in-depth static and dynamic (traffic) analysis of Android applications (APKs) and device firmware. It leverages a Kali Linux Docker container, powered by the Google Gemini CLI, to offer a controlled and powerful environment for security research. The overarching goal is to assist advanced users in systematically identifying malicious activity, understanding complex security concepts, and ultimately, empowering them in their digital self-defense.

### 1. Device Ownership and Digital Self-Defense

It is a fundamental principle that you are the absolute and rightful owner of your device. This device is your personal property. Any unauthorized software, commonly known as malware, installed on your device without your explicit and informed consent constitutes a direct violation of your ownership rights, an invasion of your privacy, and a criminal act.

Digital self-defense is a fundamental right. This project is built on the premise that you have the right to inspect, understand, and defend your own property. If malicious software is found on your device, you have the inherent right to identify the source, understand its capabilities, mitigate its impact, and pursue appropriate legal action against the perpetrators. Such unauthorized intrusions are crimes, and those responsible for deploying malware on your personal property may be subject to severe penalties under relevant cybercrime and privacy protection laws. This framework empowers you to gather the necessary evidence to understand and respond to such attacks.

### 2. How Malware May Be Pre-installed

Malware can infiltrate devices through various sophisticated and often hidden channels, sometimes even before the device reaches the end-user. Understanding these vectors is critical for a comprehensive security analysis:

Supply Chain Compromise: Highly skilled malicious actors can inject malware directly into the device's firmware or pre-load malicious applications during the manufacturing, assembly, or distribution phases. This targets the supply chain itself, making detection challenging for the average consumer.

Compromised Firmware/ROMs: If a device owner installs unofficial or custom firmware (ROMs) obtained from untrusted online sources, these ROMs may have been tampered with to include backdoors, spyware, or other forms of malware. This is a common risk associated with aftermarket modifications.

Untrusted Third-Party App Stores/Sources: While not "pre-installed" in the factory sense, downloading applications from unofficial or compromised app stores, or "sideloading" APKs from dubious websites, significantly escalates the risk of installing malicious software. These apps often mimic legitimate ones but harbor hidden, harmful functionalities.

"Bloatware" with Malicious Intent: In some cases, pre-installed applications provided by device manufacturers or mobile carriers (often referred to as "bloatware") might possess excessively broad permissions or contain hidden functionalities that could be exploited for surveillance or data collection, blurring the lines between legitimate pre-installed software and privacy-invasive tools.

Re-sold or Refurbished Devices: Devices that have been previously owned or have undergone inadequate refurbishment processes may still contain remnants of malware from prior users, or malicious software may have been intentionally installed during the refurbishment process.

The motivations behind installing such malware are diverse and often financially driven or espionage-related:

Data Theft: Illegally acquiring sensitive personal information, financial credentials, private communications, or corporate data.

Espionage: Covertly monitoring user activities, intercepting communications, tracking location, or accessing device sensors.

Financial Gain: Generating illicit revenue through intrusive advertisements, engaging in click fraud, or secretly subscribing users to premium services.

Device Control: Incorporating the device into a botnet for distributed denial-of-service (DDoS) attacks, cryptocurrency mining, or mass spamming campaigns.

Ransomware: Encrypting the user's data and demanding a ransom payment for its decryption and release.

### 3. Project Goal

This project's fundamental goal is to establish a robust and isolated environment for static and dynamic analysis of Android devices and applications. The core mission of the AI assistant is to empower advanced users. This involves clarifying complex security concepts, bridging the knowledge gap between general technical understanding and deep "hacker" insights, and guiding the user through systematic security analysis. The focus remains strictly on non-executable analysis to identify malicious indicators, potential vulnerabilities, and unusual characteristics within the software's code and structure, now complemented by the ability to analyze network traffic.

### 4. Tools and Their Purpose

The Docker container is meticulously equipped with a minimal yet exceptionally powerful set of tools, specifically curated for comprehensive static and traffic Android security analysis:

nexus-adb (Android Debug Bridge): This is the indispensable command-line tool for establishing communication with an Android device. While its executable name is nexus-adb within the Kali Linux environment, it provides the full suite of standard ADB functionalities, enabling operations such as pulling files from the device, inspecting its current state, and executing shell commands.

apktool: A cornerstone tool for Android reverse engineering. It excels at decoding Android Package Kit (.apk) files, reconstructing their resources to a nearly original form, and facilitating the extraction of critical components like the AndroidManifest.xml and Smali bytecode. It also allows for rebuilding modified APKs.

dex2jar: This utility is crucial for converting Android's Dalvik Executable (.dex) files (which contain the compiled app code) into standard Java Archive (.jar) files. This conversion is a vital intermediate step, enabling the use of conventional Java decompilers (though not included in this minimal setup) to analyze the app's Java bytecode.

default-jdk: Installs a standard Java Development Kit (JDK) within the container. This is an essential prerequisite for the correct operation of Java-dependent tools like apktool and dex2jar.

file: A fundamental command-line utility used to determine the type of a given file. This is invaluable for initial triage, helping to quickly identify the nature of unknown files.

strings (part of binutils): This tool extracts printable character sequences (ASCII and UTF-8) from binary files. It is exceptionally useful for uncovering hidden text, hardcoded URLs, command-and-control server addresses, or other embedded data within executables and libraries.

grep: A highly versatile and powerful command-line utility for searching through plain-text data. It supports regular expressions, making it indispensable for efficiently searching through large volumes of decompiled code, configuration files, or log outputs for specific patterns or indicators.

binutils: A comprehensive suite of binary tools that includes strings, objdump (for disassembling executables), and readelf (for displaying information about ELF files). These tools are critical for low-level examination of executable binaries and shared libraries.

bsdmainutils: Provides a collection of commonly used utilities, notably hexdump, which allows for viewing files in hexadecimal and ASCII formats. This is useful for inspecting raw binary data that strings might miss.

jq: A lightweight and flexible command-line JSON processor. It is invaluable for parsing, filtering, and manipulating JSON-formatted data, which is frequently encountered in API responses, configuration files, or tool outputs.

python3 & python3-pip: Python is a widely used, versatile scripting language in security research. It is ideal for automating analysis tasks, developing custom parsing scripts, or running specialized security tools. pip is Python's package installer, allowing for easy management of Python libraries.

unzip, zip, 7zip: A set of essential archive utilities. These are crucial for extracting and manipulating various compressed file formats, including Android APKs, which are fundamentally zip archives.

tcpdump: A powerful command-line packet analyzer. When used on a rooted Android device (or with proper network configuration), it can capture raw network traffic, which can then be analyzed offline for suspicious communication patterns.

tshark: The command-line version of Wireshark. It allows for capturing and analyzing network packets directly from the command line, providing deep insight into network protocols and data flows.

nmap: A free and open-source network scanner. While primarily for host discovery and port scanning, it can be useful for understanding the network environment a device is operating in or for basic checks against remote hosts.

netcat-traditional (nc): A versatile networking utility for reading from and writing to network connections using TCP or UDP. It's often called the "TCP/IP Swiss Army knife" and can be used for simple port listening, banner grabbing, or transferring files over a network.

These tools have been meticulously selected for their proven effectiveness in static and dynamic analysis, their robust availability within the Kali Linux distribution, and their collective ability to provide deep, non-intrusive insights into the internal workings of Android applications and system components, as well as their network interactions.

### 5. Getting Started: Cloning the Repository

To begin your static and traffic analysis journey, the first step is to obtain a local copy of this GitHub repository. This will provide you with the Dockerfile, scripts, and any other foundational files required for setting up your environment.

git clone https://github.com/your-username/your-repo-name.git # Replace with your actual repository URL

cd your-repo-name # Navigate into the newly cloned directory

### 6. Installing Gemini CLI on Your Host System

It is strongly recommended to install the Google Gemini CLI directly on your host operating system. This approach offers significant advantages, primarily by centralizing the management of your authentication credentials (~/.gemini/) securely on your host machine. By doing so, you can then seamlessly mount this credential directory into your Docker containers, eliminating the need for repeated authentication steps within each container instance.

Follow these steps using the provided install-gemini-cli.sh script for a streamlined installation process:

Make the script executable: Before running, ensure the script has execution permissions:

chmod +x install-gemini-cli.sh

Run the installation script:

./install-gemini-cli.sh

This script automates the following critical setup tasks:

Installs Node Version Manager (NVM): A utility that allows you to manage multiple Node.js versions on your system.

Installs Node.js v22: A specific version of the Node.js runtime, which is a prerequisite for the Gemini CLI. The script will also set this as your default Node.js version.

Installs the Google Gemini CLI globally: This makes the gemini command available from any terminal session on your host.

Crucially, it will then initiate the first launch of the gemini CLI. During this initial launch, you will be prompted to authenticate your access to the Gemini API. This typically involves a web browser opening to guide you through a Google account login process. Your authentication tokens and configuration settings will be automatically and securely saved to the ~/.gemini/ directory within your host's home folder. This setup allows for convenient re-use of credentials across your host and Docker environments. You retain the flexibility to switch to using an API key for authentication at any point in the future if your needs change.

### 7. General Device Preparation for ADB

To enable your Docker container to effectively communicate with your Android device via the Android Debug Bridge (ADB), you must configure specific developer options on your phone. These steps are broadly consistent across the majority of Android devices, though exact menu paths may vary slightly.

Enable Developer Options:

Navigate to your device's Settings menu.

Scroll down and tap on About phone.

Locate the Build number entry (its precise position might differ depending on your Android version and device manufacturer).

Tap on the "Build number" entry seven times rapidly. As you tap, you will typically see a toast message indicating a countdown (e.g., "You are now 3 steps away from being a developer!"). Upon completion, a notification will confirm that "Developer options" have been successfully enabled.

Enable USB Debugging:

Return to the main Settings menu.

A new option, typically labeled Developer options, should now be visible. This option is often found under a "System" sub-menu or directly within the main settings list. Tap on it to enter.

Within the Developer options menu, locate the USB debugging setting.

Toggle the switch next to USB debugging to the ON position. You will likely be presented with a warning dialog explaining the implications of enabling USB debugging; read it carefully and tap OK to confirm.

Authorize ADB Connection:

Physically connect your Android device to your computer via a compatible USB cable.

On your phone's screen, a critical pop-up dialog will appear, asking "Allow USB debugging?".

It is highly recommended to check the "Always allow from this computer" checkbox before tapping Allow. This action securely whitelists your computer, preventing the need to re-authorize the connection every time you connect your device.

For more detailed, device-specific instructions that account for minor variations in menu navigation, please proceed to Section 9.

### 8. Preparing Your Docker Environment

The Docker environment serves as a self-contained, consistent, and reproducible workspace, encapsulating all the necessary tools for your Android static and traffic analysis tasks.

Leveraging Gemini CLI on Your Host for Docker Management:
A powerful aspect of this setup is your ability to use the Gemini CLI installed on your host system (from Section 6) to assist in managing your Docker environment. You can ask Gemini CLI questions or provide it instructions to:

Update the Dockerfile: Describe changes you want to make to the Dockerfile, and Gemini can generate the updated content.

Rebuild the Docker Image: Instruct Gemini to provide the exact docker build command based on your Dockerfile.

Run the Docker Container: Ask Gemini to generate the docker run command with the correct mounts and arguments for your analysis session.

This allows for a highly interactive and AI-assisted workflow for maintaining and operating your analysis environment.

#### Build the Docker Image

Before you can run the container, you must build the Docker image. Navigate to the root directory of this cloned repository (the same location as your Dockerfile and build.sh script). Then, execute the build.sh script:

./build.sh

This command instructs Docker to build an image tagged as gemini-cli-image using the Dockerfile in the current directory. This process installs all the specified tools and configures the container's environment.

#### Run the Docker Container

Once the Docker image has been successfully built, use the run.sh script to launch your analysis container. This script is pre-configured to automatically start the gemini CLI upon container launch, providing you with an immediate AI-powered analysis interface.

Pre-requisite: Ensure that a directory named working-directory exists in the same location from which you are executing the run.sh script. This directory will serve as your primary project workspace, mounted directly into the container.

#### Execute the run.sh script:

./run.sh

Let's break down the key flags:

--rm: Ensures that the container is automatically removed when you exit, preventing accumulation of stopped containers.

-it: Provides an interactive terminal session within the container.

--privileged: Grants the container elevated privileges, which is essential for direct access to the host's USB devices for ADB communication.

-v /dev/bus/usb:/dev/bus/usb: This is a crucial bind mount that exposes your host machine's entire USB device bus to the container at the same path. This enables the nexus-adb client inside the container to detect and communicate with your physically connected Android device.

-v ~/.gemini:/root/.gemini: Mounts your host system's ~/.gemini/ directory (where your Gemini CLI credentials are stored from Section 6) into the container. This allows the Gemini CLI within the container to authenticate without requiring re-entry of credentials.

-v "$(pwd)/working-directory/:/working-directory/": This dynamically mounts the working-directory folder from your host (located in the current directory where you run run.sh) into the container at /working-directory/. This makes your project files and analysis outputs persistently available on your host.

The CMD instruction within the Dockerfile (which now includes bash -c "export NVM_DIR=/root/.nvm && [ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\" && nvm use 22 && exec gemini -y") will automatically launch the Google Gemini CLI as the primary process when the container starts.

### 9. Device-Specific ADB Setup Guides

While the general steps for enabling ADB (Section 7) apply broadly, specific Android device manufacturers often place "Developer options" and "USB debugging" in slightly different menu locations. Here are guides for common device types:

Google Pixel (e.g., Pixel 6a)
Enable Developer Options:

Navigate to Settings > About phone.

Locate and tap Build number seven times consecutively.

Enable USB Debugging:

Return to the main Settings menu.

Go to System > Developer options.

Toggle the USB debugging switch to the ON position.

Authorize ADB Connection:

Connect your Pixel device to your computer via USB.

On your phone's screen, accept the "Allow USB debugging?" prompt, ideally checking "Always allow from this computer."

Samsung Galaxy
Enable Developer Options:

Navigate to Settings > About phone > Software information.

Locate and tap Build number seven times consecutively.

Enable USB Debugging:

Return to the main Settings menu.

Access Developer options.

Toggle the USB debugging switch to the ON position.

Authorize ADB Connection:

Connect your Samsung device to your computer via USB.

On your phone's screen, accept the "Allow USB debugging?" prompt, ideally checking "Always allow from this computer."

Xiaomi (MIUI)
Enable Developer Options:

Navigate to Settings > About phone.

Locate and tap MIUI version seven times consecutively.

Enable USB Debugging:

Return to Settings > Additional settings > Developer options.

Toggle the USB debugging switch to the ON position.

Enable USB Debugging (Security Settings - MIUI Specific):

Within the Developer options menu, Xiaomi devices often have an additional "USB debugging (Security settings)" or similar option. You may need to enable this as well, which sometimes requires logging into your Mi Account.

Authorize ADB Connection:

Connect your Xiaomi device to your computer via USB.

On your phone's screen, accept the "Allow USB debugging?" prompt, ideally checking "Always allow from this computer."

Meizu (Flyme OS)
Enable Developer Options:

Navigate to Settings > About phone.

Locate and tap Build number seven times consecutively.

Enable USB Debugging:

Return to Settings > Accessibility (or sometimes directly in the main settings list) > Developer options.

Toggle the USB debugging switch to the ON position.

Authorize ADB Connection:

Connect your Meizu device to your computer via USB.

On your phone's screen, accept the "Allow USB debugging?" prompt, ideally checking "Always allow from this computer."
