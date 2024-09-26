# Hacking Shield with SQL Injection Detection

## Overview
The **Hacking Shield** is a security-focused application designed to detect SQL injection attacks and alert administrators in real time. It utilizes machine learning techniques to analyze SQL queries, classifies them as either harmful or benign, and automatically sends email alerts when malicious activity is detected. This system can be expanded to protect against other types of hacking attacks in the future.

## Features
- **Machine Learning Model:** Uses a logistic regression model to classify SQL queries.
- **SQL Injection Detection:** Detects potentially harmful SQL injection queries.
- **Email Alert System:** Sends automatic email alerts to the administrator when harmful queries are detected.
- **SQL Query Generator:** Automatically generates harmful SQL injection queries for testing purposes.
- **Real-time Protection:** Capable of running in real-time for continuous protection.

## Project Structure
```bash
/hacking-shield-app
├── /src
│   ├── /ml_model
│   │   ├── detection_model.py      # SQL injection detection model code
│   │   └── query_generator.py      # SQL injection query generator
│   ├── /email_alert
│   │   └── email_alert.py          # Email alert sender script
│   ├── main.py                     # Main entry point for running the app
├── /data
│   └── sql_queries_dataset.csv      # Labeled dataset of SQL queries (benign and harmful)
├── /configs
│   └── config.json                  # Configuration file for API keys and email settings
├── /tests
│   └── test_model.py                # Script for testing the model with queries
├── README.md                        # Documentation
├── requirements.txt                 # Python dependencies
└── .env                             # Environment variables (email credentials)
```

## Installation

### Prerequisites
- **Python 3.8+**
- A **Google App Password** for sending email alerts (see [Google App Passwords](https://support.google.com/mail/answer/185833?hl=en) for more details).

### Steps to Install

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/hacking-shield-app.git
   cd hacking-shield-app
   ```

2. **Set Up a Virtual Environment (optional but recommended)**
   ```bash
   python -m venv venv
   source venv/bin/activate  # For Windows: venv\Scripts\activate
   ```

3. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Set Up Environment Variables**
   Create a `.env` file in the root directory with the following details:
   ```
   SENDER_EMAIL=your-email@gmail.com
   RECEIVER_EMAIL=admin-email@example.com
   EMAIL_PASSWORD=your-google-app-password
   ```

5. **Prepare the Dataset**
   Add your dataset in the `/data` folder with the filename `sql_queries_dataset.csv`. The dataset should contain two columns: `query` (SQL query) and `label` (1 for harmful, 0 for benign).

## Running the Application

1. **Train the Model & Detect SQL Injections**
   Run the `main.py` script:
   ```bash
   python src/main.py
   ```
   This will:
   - Load the dataset
   - Train the logistic regression model
   - Test it on predefined harmful SQL queries
   - Send an email alert for any harmful queries detected

2. **Generate SQL Injection Test Data (Optional)**
   To generate SQL injection queries for testing:
   ```bash
   python src/ml_model/query_generator.py
   ```

## Usage

- The app will automatically classify SQL queries as **harmful** or **benign** based on a trained machine learning model.
- If a harmful query is detected, an email alert will be sent to the administrator's email.

## Configuration
- **Email Alerts:** Configure the sender and receiver emails in the `.env` file. Ensure the sender email has the correct Google App Password to enable SMTP email functionality.
- **Config.json:** You can also modify the `config.json` file in the `/configs` folder to store additional settings like API keys or change alert settings.

## Testing
To test the detection model:
1. Add more SQL injection samples in the `test_model.py` file.
2. Run the `test_model.py` to validate the performance:
   ```bash
   python src/tests/test_model.py
   ```

## Dependencies
The dependencies for this project are listed in the `requirements.txt` file. They can be installed using:
```bash
pip install -r requirements.txt
```
Main dependencies include:
- **Pandas:** For data handling and manipulation.
- **Scikit-learn:** For machine learning model development.
- **TfidfVectorizer:** For feature extraction from text (SQL queries).
- **SMTP library:** For sending email alerts.
  
## Future Improvements
- **Additional Hacking Detection:** Extend the app to detect other forms of hacking attempts beyond SQL injections.
- **Improved Model:** Incorporate more advanced models like deep learning for more accurate predictions.
- **Dashboard:** Add a user-friendly dashboard to monitor detected queries and alerts.

## Troubleshooting

- **SMTP Email Issues:**
  - Ensure the sender email has 2-step verification enabled.
  - Generate an App Password via Google for the email account used.
  - Make sure the `.env` file contains the correct credentials.
  
- **Data Errors:**
  - Ensure the dataset is properly formatted with columns `query` and `label`.
  
- **Model Performance:**
  - Adjust training data size or tweak model parameters if the prediction accuracy is low.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author
[Robotics Club CBU]

