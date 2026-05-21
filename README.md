# Supply Chain Intelligence System
## Google Antigravity Hackathon — Challenge 1

---

## Project Overview
An agentic AI system that ingests multiple 
logistics data sources, detects contradictions, 
generates a constrained action plan, simulates 
execution, and shows measurable outcome changes.

---

## Domain
Logistics / Supply Chain

---

## Architecture
The system uses 4 agents orchestrated via 
Google Antigravity:

1. Content Ingest Agent
   Reads 5 data sources and extracts signals
   with credibility scores

2. Insight & Contradiction Detector
   Identifies conflicting sources, flags stale
   data, generates core insight and risk level

3. Action Planner Agent
   Generates 5-step action chain within
   PKR 500,000 budget constraint

4. Simulation Agent
   Executes actions, handles failures,
   shows before vs after state change

---

## How Google Antigravity Is Used
- All 4 agents run as separate conversations
  in Antigravity Agent Manager
- Each agent receives output of previous agent
  as input (orchestrated chain)
- Plan mode used to generate full reasoning
  traces and artifacts
- Agent Manager logs show complete decision
  trail for all 4 agents

---

## Data Sources (5 inputs)
1. warehouse.csv — stock levels (structured)
2. supplier_email.txt — delay notice (unstructured)
3. sales_dashboard.json — demand data (semi-structured)
4. complaints.csv — customer sentiment (structured)
5. news_feed.txt — external risk (unstructured/real-time)

---

## Tools and APIs Used
- Google Antigravity — agent orchestration
- Flutter — mobile app framework
- Dart — programming language

---

## Constraints Applied
- Budget: PKR 500,000 maximum
- Urgency: All actions within 48 hours
- Actions: Maximum 5 in chain

---

## Assumptions
- Data files are mock/simulated for demo
- No real personal data used
- WhatsApp API failure is intentionally 
  simulated to demonstrate recovery

---

## Failure and Recovery Evidence
ACT-002 WhatsApp API notification failed 
with error 503. System automatically 
triggered SMS fallback. Recovery successful.
See failure_log.json for full details.

---

## Baseline Comparison
A simple non-agentic system would only 
summarize the 5 inputs. Our system goes 
further by detecting contradictions between 
sources, applying credibility scoring, 
generating a constrained action chain, 
simulating execution with failure recovery, 
and showing measurable state change.

---

## Cost and Scalability
- Cost per agent run: approximately $0.02
- 10x scale: system handles 50 sources 
  with same architecture
- 100x scale: parallel agent conversations
  in Antigravity handle 500 sources

---

## Limitations
- Data sources are mock, not live APIs
- Mobile app runs as web app in browser
- Action simulation is not connected to 
  real external systems

---

## Team
[Team Name: CodeWeaver]
[Members Name: Irfan Karim, Haider Anjum]