Ethi_Phishing



Overview

Ethi_Phishing, created by Mudasir Hussain, is a GitHub repository dedicated to ethical phishing research and cybersecurity education. This project provides tools and simulations to study phishing techniques in a controlled, responsible manner, helping users understand and defend against real-world cyber threats. All resources are intended for authorized, ethical use in educational settings or consented penetration testing environments.



Disclaimer: Unauthorized phishing is illegal and unethical. This repository is for educational purposes only and must comply with all applicable laws and ethical standards.

Features





Ethical Simulations: Safe, controlled tools to illustrate phishing tactics for educational purposes.



Local and Tunneled Deployment: Supports localhost and ngrok for secure, controlled testing environments.



Educational Resources: Includes disclaimers and links to cybersecurity awareness materials.



Community-Driven: Open to contributions from cybersecurity enthusiasts and professionals.

Prerequisites

To run the simulation script, ensure the following are installed:





Bash: Available on Linux, macOS, or Windows (via WSL or Git Bash).



PHP: Used to serve simulation pages locally.





Ubuntu: sudo apt-get install php



macOS: brew install php



Windows: Download from php.net



ngrok: Used to create secure tunnels for testing simulations in controlled environments.





Download and install from ngrok.com.



Follow setup instructions to configure ngrok with your account.



A web browser (e.g., Chrome, Firefox) to view the simulation.

Installation





Clone the repository:

git clone https://github.com/Mudasirrr/Ethi_Phishing.git
cd Ethi_Phishing



Set execute permissions for the script:

chmod +x scripts/ethical_phish.sh



Configure ngrok:





Run the following command, replacing <your-auth-token> with your token from the ngrok dashboard:

ngrok authtoken <your-auth-token>



Verify ngrok is accessible:

ngrok --version

Usage

The ethical_phish.sh script launches an ethical phishing simulation for cybersecurity training, supporting both local and ngrok-tunneled servers for controlled testing. Follow these steps to execute it:





Run the script:

./scripts/ethical_phish.sh



What Happens:





A local PHP server starts on http://localhost:8080.



If ngrok is enabled, a secure tunnel is created, and a public URL is provided for testing in a controlled environment.



Terminal instructions guide you to access the simulation via the local or ngrok URL.



View the simulation:





Open http://localhost:8080 in your browser for local access.



Alternatively, use the ngrok URL displayed in the terminal for tunneled access.



The simulation page includes a prominent disclaimer and links to phishing prevention resources.



Stop the server:





Press Ctrl+C in the terminal to stop the PHP server and ngrok tunnel cleanly.



Note: The simulation is non-functional and cannot capture credentials. It is designed solely for educational purposes to demonstrate phishing techniques in a controlled, ethical setting.

Example Output

Running the script produces:

:: Ethi_Phishing: Ethical Cybersecurity Simulation ::
:: For authorized educational use only. ::
:: Unauthorized use is illegal and unethical. ::

[*] Starting local server on http://localhost:8080...
[*] Starting ngrok tunnel...
[*] Ngrok URL: https://<random>.ngrok.io
[*] Open http://localhost:8080 or the ngrok URL in your browser to view the simulation.
[*] Press Ctrl+C to stop the server.

Ethical Guidelines





Authorized Use Only: Use this tool only in controlled, consented environments (e.g., with a signed penetration testing agreement).



No Real Credentials: Never input real credentials into simulation pages, even for testing.



Educational Mission: Use this project to educate others about phishing risks and defenses.



Legal Compliance: Adhere to laws like the Computer Fraud and Abuse Act (CFAA) or equivalent regulations in your region.

Contributing

We welcome contributions from the cybersecurity community! To contribute:





Review our CONTRIBUTING.md for guidelines.



Fork the repository, implement changes, and submit a pull request.



Ensure contributions align with our ethical and educational goals.

Suggested Contributions:





Tools showcasing phishing techniques in controlled settings.



Guides on phishing prevention and detection.



Resources for analyzing phishing tactics in lab environments.

Resources





FTC Phishing Awareness Guide



OWASP Phishing Resources



NIST Cybersecurity Framework

License

This project is licensed under the MIT License.

Contact

For inquiries or suggestions, open an issue on GitHub or contact Mudasir Hussain at <hmudasir714@gmail.com>.



Ethi_Phishing: Empowering a safer digital world through ethical education and research.
