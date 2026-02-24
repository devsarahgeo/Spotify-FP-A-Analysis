# Spotify FP&A (Financial Planning & Analysis)

## 🧭 Executive Summary 
<p>
This analysis evaluates the key financial drivers of advertising and podcast revenue. It examines how user engagement, content mix (music vs. podcasts), pricing strategy, and ad monetization efficiency influence revenue growth, gross margins, and long-term profitability.
</p>

---

### 💼 Business Problem
<p>
Spotify needs to improve revenue growth and profitability, but it is unclear which operational and financial levers (engagement, content mix, pricing, or ad monetization) have the greatest impact on margins and long-term value.

Without understanding these drivers, the company cannot confidently decide:

Whether to push podcast growth vs. music

Whether to increase ad load

Where to allocate investment for maximum profitability

</p>

---
## ❓ Analysis Questions 
<p>
  
#### Revenue & Engagement Questions

Which podcasts, tracks and artists drive the most revenue? - 

How does user engagement (streams) impact revenue?

Which genres monetize best?

How release patterns affect monetization?

How sensitive revenue is to CPM changes?

#### Cost & Margin Questions

Are podcasts more profitable than music? or Which content types have the highest gross margin? or What should Spotify invest more in?

Does higher engagement always mean higher margin? 

Which content destroys margin?

#### Scenario & Forecasting Questions
(You can model:

+10% streams

-5% CPM

Royalty increase

Geographic shift

Now you're answering:

If CPM drops 10%, what happens to margin?

That’s not reporting.

That’s forecast modeling.)

What happens if streams increase 10–20%?

What is the impact of a 5–10% CPM change on revenue?

Which content types or geographies provide the best ROI?

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
    <li><strong>Google Clod storage (GCS)</strong> – Raw Data Store (Data Lake)</li>
  <li><strong>BigQuery</strong> – Cloud Data Warehouse</li>
  <li><strong>PowerBI</strong> – Data visualization and storytelling</li>
  <li><strong>SQL and Python</strong> – Analytical querying</li>
</ul>

---

## ⚙️ Methodology 

Designed a multi-table analytical model using SQL (joins, CTEs, window functions) and Python to derive core e-commerce metrics. Conducted category, regional, and customer segmentation analysis to identify GTM opportunities and growth signals, and communicated insights via Looker dashboards.

<h3>1. Dataset Used:</h3> 
Spotify Web API - https://developer.spotify.com/documentation/web-api/

Note: Since Spotify’s public API does not provide stream counts or ad monetization metrics, I constructed a revenue simulation model using track popularity as a proxy for demand. Streams were estimated as popularity × 1000, impressions per stream were randomized between 1–3 based on typical ad loads, and CPM was assumed at $5 based on industry benchmarks. This allows scenario-based revenue modeling for analytical purposes.

I simulated the user data, I used a constant CPM throught 2024 and since stream impressions are less and dataset size is small,  hence overall revenue will be a small amnt

<h3>2. Architecture Diagram:</h3>
<img width="724" height="1169" alt="Olist E-commerce Data Pipeline Architecture - visual selection (2)" src="https://github.com/user-attachments/assets/963db6e0-f50c-4b46-921d-3b693ddce5f9" />

<h3>3. Database (Postgres) showing cardinality relationship</h3>
<img width="1461" height="814" alt="Screenshot 2026-01-29 at 5 14 20 PM" src="https://github.com/user-attachments/assets/65e1e763-07a8-4db0-90fb-7d74d2534433" />

---

## 📈 Results

Power BI Report Snapshot:

<img width="1425" height="803" alt="Screenshot 2026-02-24 at 12 24 11 AM" src="https://github.com/user-attachments/assets/cce9a27e-d779-46ed-9a2e-d88423ba2822" />


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




