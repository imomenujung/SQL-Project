# SQL Projects
Compilation of SQL data analysis related projects and challenges where I practice those skills.

### Built with

+ SQL Languages
	+ SQL
	+ SQLite
	
+ Python
	+ jupyter notebook


# Projects & Challenges

## [Retail Bike Store Data Analysis](https://github.com/imomenujung/SQL-Project/tree/main/Data-Analyst/Bike-Store-Relational)
The GitHub project "Bike Store Sales Analysis" involves analyzing sales data from a bike store to identify trends, patterns, and areas for improvement. A summary of the Project stages include:
1. **Data Loading and Exploration:** Loaded dataset from CSV files, created a SQLite database, and performed exploratory analysis using SQL queries to understand the structure and content of the data.
2. **Data Cleaning:** Addressed missing values in the 'shipped_date' column by replacing them with 'Need Update' to indicate the need for further investigation.
3. **Customer Segmentation:** Segmented customers based on purchase frequency, recency, and spending behavior to identify different customer groups and their characteristics.
4. **Sales Analysis:** Calculated total sales amount for each month to track sales performance over time.
5. **Customer Order Pattern Analysis:** Investigated customer order patterns, particularly a decline in sales after June 2018, to understand potential reasons for the drop.
6. **Sales Growth Analysis:** Calculated month-over-month sales growth for the years 2016 and 2017 to identify trends and patterns in sales performance.
7. **Data Visualization:** Used Plotly to create line charts visualizing sales growth over time for both 2016 and 2017, providing a clear visual representation of sales trends.


## [Telco Customer Churn Prediction](https://github.com/imomenujung/SQL-Project/tree/main/Data-Analyst/Churn-Prediction)
The GitHub project "Telco Customer Churn Prediction" involves To predict customer churn using machine learning and analyze churn patterns. A summary of the Project stages include:
1. **Data Loading and Exploration:** Loaded dataset, checked for null values, performed exploratory analysis using SQL queries.
2. **Feature Engineering:** Created 'tenure_group' and 'charges_group' features to categorize tenure and monthly charges.
3. **Data Preprocessing:** Encoded categorical features using LabelEncoder.
4. **Model Training:** Split data into training and testing sets, trained a RandomForestClassifier model.
5. **Model Evaluation:** Evaluated model performance using accuracy, confusion matrix, and classification report.
6. **Churn Analysis:** Analyzed churn rate by tenure group and charges group using SQL queries.


## [Customer Segmentation for Online Retail](https://github.com/imomenujung/SQL-Project/tree/main/Data-Analyst/Customer-Segmentation)
The GitHub project "Customer Segmentation for Online Retail" involves segmenting customers based on their purchasing behavior to optimize marketing strategies. A summary of the Project stages include:
1. **Data Acquisition and Cleaning:** Retrieved online retail dataset, handled missing values, removed duplicates, ensuring data quality for analysis.
2. **RFM Analysis:** Calculated Recency, Frequency, and Monetary values for each customer to understand their purchasing patterns.
3. **Customer Segmentation:** Segmented customers into distinct groups (e.g., loyal customers, at-risk customers) based on their RFM scores.
4. **Visualization:** Utilized various visualizations (scatter plots, heatmaps, 3D scatter plots) to gain insights into customer segments and their characteristics.


## [Customer Lifetime Value](https://github.com/imomenujung/SQL-Project/tree/main/Data-Analyst/Customer-lifetime-value)
The GitHub project "Customer Lifetime Value Analysis" aims to calculate and analyze the Customer Lifetime Value (CLV) of customers based on their purchase history and behavior. This analysis helps businesses understand the long-term value of their customers and make informed decisions about customer acquisition, retention, and marketing strategies.A summary of the Project stages include:
1. **Data Loading and Integration:** Loaded three datasets ('List of Orders', 'Order Details', 'Sales Target') from a GitHub repository into a SQLite database for efficient data management and querying.
2. **Exploratory Data Analysis (EDA):** Performed EDA using SQL queries to gain insights into customer purchase patterns, such as the number of transactions per customer, total amount spent, average purchase value, and purchase frequency.
3. **Customer Lifetime Value (CLV) Calculation:** Calculated CLV for each customer using a simplified formula based on total spending and an assumed gross margin.
4. **Further Analysis and Insights (Potential):** The project could be extended to include more sophisticated CLV calculation methods, customer segmentation based on CLV, and predictive modeling to identify high-value customers and potential churn risks.

## [E-Commerce Sales Analysis](https://github.com/imomenujung/SQL-Project/tree/main/Data-Analyst/Online-sales-dataset)
The GitHub project "E-Commerce Sales Analysis" delves into an e-commerce sales dataset to extract valuable insights and trends. 
1. **Data Acquisition and Preparation:** The dataset is obtained from a public source (GitHub) and loaded into a Pandas DataFrame for analysis. 
2. **Exploratory Data Analysis (EDA):**  Initial exploration of the data is performed using Pandas and SQL to understand the structure, identify potential issues, and uncover preliminary insights.
3. **Data Cleaning and Transformation:**  Necessary steps are taken to handle missing values, correct data types, and transform variables as needed for analysis.
4. **SQL Analysis:** SQL queries are crafted to answer specific business questions related to sales trends, product performance, customer behavior, and regional variations.
5. **Data Visualization:**  Key findings are visualized using appropriate charts and graphs to communicate insights effectively.



