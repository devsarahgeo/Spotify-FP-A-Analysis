# Spotify FP&A Analysis

## 🧭 Executive Summary 
<p>
Identify the key drivers of ad and podcast revenue and quantify how user engagement, content mix, and pricing affect revenue growth.

Primary Question:
How do user engagement and content consumption patterns influence advertising and podcast revenue, and what strategic levers can a streaming platform use to maximize monetization and long-term growth?

</p>

---

### 💼 Business Problem
<p>
Olist marketplace wanted to understand trends in order volumes, cancellations, and repeat buyers over time, as these metrics affect revenue and customer retention. Without this insight, management cannot identify growth opportunities or operational challenges.
  
Key Questions:
<ul>
  <li> Which sellers and product categories drive the most GMV and revenue?</li>
  
  <li> How order volumes and cancellations are trending month-to-month?</li>
  
  <li> How repeat customers behave and which segments are most valuable?</li>
</ul

Answering these questions helps the business identify growth opportunities, reduce operational issues (like cancellations), and improve customer retention.

<b>Core Challenge</b>: How can the marketplace increase revenue, reduce cancellations, and retain more customers?
</p>

---
## ❓ Analysis Questions 
<p>
  
#### GMV:
Which sellers contribute the most to GMV?

Which product categories drive the highest GMV?

How does GMV trend over months? Are there seasonal spikes?

#### Order Volume & Growth

How many orders are placed per month?

How many new vs returning customers are placing orders?

#### Customer Behavior

What is the repeat buyer rate per month?

Which cities or regions have the highest number of active buyers?

Do certain product categories have higher repeat purchases?

#### Operational / Cancellation Metrics

What is the order cancellation rate over time?

Are cancellations clustered by seller? Which seller regions are slower to ship?

Which product categories have the most canceled orders?

#### Delivery / Logistics

What is the average delivery time?

Are certain sellers or cities experiencing delays?


#### Customer Segmentation / Clustering

Can we segment buyers into high-value / mid-value / low-value groups using RFM (Recency, Frequency, Monetary)?

Which segments contribute most to GMV?


</p>

---

## 💻 Git File Structure Explained:

<strong>analysis_notebooks/olist_analysis_with_eda.ipynb</strong> : This code does EDA, generates answers for each analysis question and can also be used to validate the final bi analysis results.

<strong>analysis_notebooks/olist_analysis_for_bi.ipynb</strong> : This code generates combined tables to answer multiple business questions for use in a BI tool.

<strong>final_demo/Olist-Ecommerce-Analysis</strong> : Final demo/business insights showcase made by storing data in Google BigQuery and using Looker to visualize.

<strong>config</strong> : All paths

<strong>data</strong> : Raw and processed data

<strong>etl</strong> : All ETL steps split into clear stages for ease of testing, replacing

<strong>utils</strong> : Common reusable functions

<strong>pipelines</strong> : A central place to define what runs, in which order, and how. They orchestrate the different ETL steps (extract, transform, load) and ensure everything runs smoothly.

---

## 🧠 Skills & Tech Stack
<ul>
  <li><strong>Visual Studio Code</strong> – Central development environment</li>
    <li><strong>PostgreSQL</strong> – Raw Data Store</li>
  <li><strong>BigQuery</strong> – Cloud Data Warehouse</li>

  <li><strong>Looker</strong> – Data visualization and storytelling</li>
  <li><strong>SQL and Python</strong> – Analytical querying</li>
</ul>

---

## ⚙️ Methodology 

Designed a multi-table analytical model using SQL (joins, CTEs, window functions) and Python to derive core e-commerce metrics. Conducted category, regional, and customer segmentation analysis to identify GTM opportunities and growth signals, and communicated insights via Looker dashboards.

<h3>1. Dataset Used:</h3> 
Olist Dataset - https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/

<h3>2. Architecture Diagram:</h3>


<h3>3. Database (Postgres) showing cardinality relationship</h3>
<img width="1461" height="814" alt="Screenshot 2026-01-29 at 5 14 20 PM" src="https://github.com/user-attachments/assets/65e1e763-07a8-4db0-90fb-7d74d2534433" />

---

## 📈 Results

Looker Report Snapshot:


<img width="974" height="872" alt="Screenshot 2026-01-29 at 2 09 56 PM" src="https://github.com/user-attachments/assets/b76e3feb-d43a-4e8c-b9c8-501076d8d2bc" />

<img width="973" height="878" alt="Screenshot 2026-01-29 at 2 10 03 PM" src="https://github.com/user-attachments/assets/3632ecca-9132-41a2-be19-241ab89230b7" />

<img width="963" height="879" alt="Screenshot 2026-01-29 at 2 33 16 PM" src="https://github.com/user-attachments/assets/b6e31d8f-85fd-4a4d-88c6-b9f09e8ee55c" />

<img width="974" height="657" alt="Screenshot 2026-01-29 at 2 10 14 PM" src="https://github.com/user-attachments/assets/aa8d2ba3-db1e-4f78-bbf0-2ac850875ae6" />


---

## 📊 Business Insights & Recommendations


<u>**Key Metrics / Highlights**</u>:

| **Metric**                   | **Highlight**                           |
| ---------------------------- | --------------------------------------- |
| **Top Seller GMV**           | 227k                                    |
| **Top Product Category**     | Health & Beauty                         |
| **Highest Repeat Purchases** | Arts & Craftsmanship                    |
| **Peak Sales Months**        | May & August                            |
| **Highest Cancellations**    | Sports Leisure product category         |
| **Top Cities**               | Sao Paulo & Rio de Janeiro              |


**Business Insights, Impact & Recommendations**:

<ul>
<li> New customers drive the majority(~31%) of GMV, making customer acquisition a primary growth lever. 

 <u><b>Recommendation:</b></u> Launch targeted campaigns to acquire new customers. 
</li>

<li> Repeat customer activity peaks in October, indicating opportunities for targeted retention and promotional strategies.

 <u><b>Recommendation:</b></u> October retention peak suggests running loyalty campaigns before Q4. </li>

<li>Customer activity concentrated in Sao Paulo & Rio de Janeiro. Geographic concentration shows high-value markets.
  
 <u><b>Recommendation:</b></u> Strengthen retention, logistics, and seller support in Sao Paulo and Rio de Janeiro while expanding acquisition efforts in emerging cities. Run acquisition campaigns and seller onboarding in emerging cities to expand reach. </li>

<li>
Customers can be grouped into RFM segments (Recency, Frequency, Monetary). Each segment behaves differently (e.g., frequent high-spenders vs. new low-spenders).
  
Tailoring campaigns to segments can improve revenue and ROI. Generic campaigns may underperform because they ignore behavioral differences
  
 <u><b>Recommendation:</b></u> Implement segment-specific marketing strategies tailored to each RFM segment to maximize revenue growth and efficiency:

- Retain high-value customers with loyalty campaigns
- Re-engage At-Risk High-Value Customers (“Cannot Lose Them” customer segment) through targeted campaigns before they churn.
- Increase spending among Potential Loyalists via personalized recommendations, cross-selling, and promotions.
    
</li>

<li>
Historical data shows GMV peaks in May and August. These months consistently generate more revenue than others.

The business can maximize revenue by focusing marketing and promotional efforts during these peak months.

 <u><b>Recommendation:</b></u> Run special offers, loyalty programs, and targeted campaigns in May and August to capitalize on high GMV periods.
</li>

<li>
  Sports Leisure product category has high cancellation rates
  
  High cancellations reduce customer satisfaction, revenue, and operational efficiency.

   <u><b>Recommendation:</b></u> Investigate and resolve high-cancellation products and sellers. Improve logistics, inventory planning, and category-specific processes to reduce cancellations.
  
</li>

</ul>

---

## ⚡ Future Scope - Scalable Implementation 
*(If the project needs to handle additional data or extended time periods in the future)*

<ul>
<li> <b>Data Validation</b>: Implement CI/CD pipelines to automatically check schema consistency, null values, and aggregation sanity.</li>

<li> <b>Cloud Data Warehouse</b>: Store both raw and BI-ready tables directly in BigQuery or Snowflake, bypassing local Postgres to ensure scalability and performance.</li>

</ul>




