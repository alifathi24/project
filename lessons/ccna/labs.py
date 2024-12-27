# Directory setup for labs
import os

# Define lab topics and subtopics
labs = {
    "Network Fundamentals": [
        "Explore Cisco Devices",
        "Router Basics",
        "Switch Basics",
    ],
    "IPv4 and IPv6 Configuration": [
        "Configure Global IPv4 Addressing",
        "Subnet an IPv4 Network",
        "Configure IPv6 Address Types",
        "Explore the MAC Address Table",
    ],
    "Network Access": [
        "Configure InterVLAN Routing",
        "Configure and Verify VTP",
        "Configure Layer 2 EtherChannel LACP",
    ],
    "IP Connectivity": [
        "Configure OSPFv2 Adjacencies",
        "Manually Configure Static and Default Routes",
        "Troubleshoot an OSPFv2 Configuration",
    ],
    "IP Services": [
        "Configure Static NAT",
        "Configure DHCP for IPv4 Networks",
        "Explore Syslog Output",
    ],
    "Security Fundamentals": [
        "Configure the Enable Secret Password",
        "Explore and Configure Standard Numbered ACLs",
        "Implement Port Security",
    ],
    "Automation and Programmability": [
        "Compare a Traditional Network to a Controller-Based Network",
        "Submit and Explore Ansible, Chef, and Puppet Queries",
    ],
}

# Directory path to store labs
base_path = "/mnt/data/PacketTracerLabs"

# Create directories for each topic and subtopic
for topic, subtopics in labs.items():
    topic_path = os.path.join(base_path, topic.replace(" ", "_"))
    os.makedirs(topic_path, exist_ok=True)
    for subtopic in subtopics:
        subtopic_path = os.path.join(topic_path, subtopic.replace(" ", "_"))
        os.makedirs(subtopic_path, exist_ok=True)

# Verify created directory structure
os.listdir(base_path)
