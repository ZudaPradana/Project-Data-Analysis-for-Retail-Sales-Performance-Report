# Project-Data-Analysis-for-Retail-Sales-Performance-Report
Tools:
<ul>
  <li>PostgreSQL</li>
  <li>DBeaver</li>
</ul>


## Dataset Brief
Dataset yang digunakan berisi transaksi dari tahun 2009 sampai dengan tahun 2012 dengan jumlah raw data sebanyak 5500, termasuk di dalamnya order status yang terbagi menjadi order finished, order returned dan order cancelled

Berikut adalah kolom yang dimiliki oleh dqlab_sales_store tabel:
<ul>
    <li>OrderID</li>
    <li>Order Status</li>
    <li>Customer</li>
    <li>Order Date</li>
    <li>Order Quantity</li>
    <li>Sales</li>
    <li>Discount %</li>
    <li>Discount</li>
    <li>Product Category</li>
    <li>Product Sub-Category</li>
</ul>

#### Question:
<h3>1. Overal Performance</h3>
<ol>
    <li>Overall perofrmance DQLab Store dari tahun 2009 - 2012 untuk jumlah order dan total sales order finished</li>
    <li>Overall performance DQLab by subcategory product yang akan dibandingkan antara tahun 2011 dan tahun 2012</li>
</ol>

<h3>2. Promotion effectiveness and efficiency</h3>
<ol>
    <li>Efektifitas dan efisiensi promosi yang dilakukan selama ini, dengan menghitung burn rate dari promosi yang dilakukan overall berdasarkan tahun</li>
    <li>Efektifitas dan efisiensi promosi yang dilakukan selama ini, dengan menghitung burn rate dari promosi yang dilakukan overall berdasarkan sub-category</li>
</ol>

<h3>3. Customer Analysis</h3>
<ol>
    <li>Analisa terhadap customer setiap tahunnya</li>
    <li>Analisa kemungkinan retensi customer setiap tahunnya</li>
</ol>

### <b>1. Overal Performance</b>
Pada bagian ini kita akan melakukan analisa terhadap performa penjualan berdasarkan sub category dan bagaimana perkembangan penjualan setiap tahunnya


##### 1.1 Overall Performance by Year
<p>Result: </p>
<div name="Performance_by_Year">
  <table>
    <tr>
      <th>years</th>
      <th>sales</th>
      <th>number_of_order</th>
    </tr>
    <tr>
      <td>2009</td>
      <td>4613872681</td>
      <td>1244</td>
    </tr>
    <tr>
      <td>2010</td>
      <td>4059100607</td>
      <td>1248</td>
    </tr>
    <tr>
      <td>2011</td>
      <td>4112036186</td>
      <td>1178</td>
    </tr>
    <tr>
      <td>2012</td>
      <td>4482983158</td>
      <td>1254</td>
    </tr>
  </table>
  <p>
    Note:
    <ul>
      <li>Use condition order status is finished</li>
    </ul>
  <p>
    <br><br>
</div>


##### 1.2 Overall Performance by Product Sub Category
<p>Result: </p>
<div name="table_Overall_Performance_by_Product_Sub_Category">
  <table>
    <tr>
      <th>years</th>
      <th>product_sub_category</th>
      <th>sales</th>
    </tr>
    <tr>
      <td>2011</td>
      <td>Chairs & Chairmats</td>
      <td>622962720</td>
    </tr>
    <tr>
      <td>2011</td>
      <td>Office Machines</td>
      <td>545856280</td>
    </tr>
    <tr>
      <td>2011</td>
      <td>Tables</td>
      <td>505875008</td>
    </tr>
  </table>
  <p>
    Note:
    <ul>
      <li>The result is not only show 3 rows</li>
      <li>Use condition is only in 2011 and order status is finished</li>
    </ul>
  <p>
    <br><br>
</div>

### <b>2. Promotion Effectiveness and Efficiency by Years</b>
Pada bagian ini kita akan melakukan analisa terhadap efektifitas dan efisiensi dari promosi yang sudah dilakukan selama ini. Efektifitas dan efisiensi dari promosi yang dilakukan akan dianalisa berdasarkan Burn Rate yaitu dengan membandigkan total value promosi yang dikeluarkan terhadap total sales yang diperoleh

DQLab berharap bahwa burn rate tetap berada diangka maskimum 4.5%

<b>Formula untuk burn rate : (total discount / total sales) * 100</b>


##### 2.1 Efektifitas dan efisiensi promosi yang dilakukan selama ini, dengan menghitung burn rate dari promosi yang dilakukan overall berdasarkan tahun
<p>Result: </p>
<div name="table_Promotion_Effectiveness_and_Efficiency_by_Years">
  <table>
    <tr>
      <th>years</th>
      <th>sales</th>
      <th>promotion_value</th>
      <th>burn_rate_percentage</th>
    </tr>
    <tr>
      <td>2009</td>
      <td>4613872681</td>
      <td>214330327</td>
      <td>4.65</td>
    </tr>
    <tr>
      <td>2010</td>
      <td>4059100607</td>
      <td>197506939</td>
      <td>4.87</td>
    </tr>
    <tr>
      <td>2011</td>
      <td>4112036186</td>
      <td>214611556</td>
      <td>5.22</td>
    </tr>
    <tr>
      <td>2012</td>
      <td>4482983158</td>
      <td>225867642</td>
      <td>5.04</td>
    </tr>
  </table>
  <p>
    Note:
    <ul>
      <li>Use condition order status is finished</li>
    </ul>
  <p>
  <br><br>
</div>


##### 2.2 Promotion Effectiveness and Efficiency by Product Sub Category
<p>Result: </p>
<div name="table_Promotion_Effectiveness_and_Efficiency_by_Product_Sub_Category">
  <table>
    <tr>
      <th>years</th>
      <th>product_sub_category</th>
      <th>product_category</th>
      <th>sales</th>
      <th>promotion_value</th>
      <th>burn_rate_percentage</th>
    </tr>
    <tr>
      <td>2012</td>
      <td>Office Machines</td>
      <td>Technology</td>
      <td>811427140</td>
      <td>46616695</td>
      <td>5.75</td>
    </tr>
    <tr>
      <td>2012</td>
      <td>Chairs & Chairmats</td>
      <td>Furniture</td>
      <td>654168740</td>
      <td>26623882</td>
      <td>4.07</td>
    </tr>
    <tr>
      <td>2012</td>
      <td>Telephones and Communication</td>
      <td>Technology</td>
      <td>422287514</td>
      <td>18800188</td>
      <td>4.45</td>
    </tr>
  </table>
  <p>
    Note:
    <ul>
      <li>The result is not only show 3 rows</li>
      <li>Use condition is only in 2012 and order status is finished</li>
    </ul>
  <p>
  <br><br>
</div>

### <b>3. Customer Analysis</b>
Pada bagian ini kita akan melakukan analisa terhadap bagaimana aktivitas transaksi yang dilakukan atau behaviour transaction customer


##### 3.1 Customers Transactions per Year
<p>Result: </p>
<div name="table_Customers_Transactions_per_Year">
  <table>
    <tr>
      <th>years</th>
      <th>number_of_customer</th>
    </tr>
    <tr>
      <td>2009</td>
      <td>585</td>
    </tr>
    <tr>
      <td>2010</td>
      <td>593</td>
    </tr>
    <tr>
      <td>2011</td>
      <td>581</td>
    </tr>
    <tr>
      <td>2012</td>
      <td>594</td>
    </tr>
  </table>
  <p>
    Note:
    <ul>
      <li>Use condition order status is finished</li>
    </ul>
  <p>
  <br><br>
</div>


#### 3.2 Possible Customers Retention per Year
<p>Result: </p>
<div name="table_Possible_Customers_Retention_per_Year">
  <table>
    <tr>
      <th>years</th>
      <th>possible_churn</th>
      <th>normal</th>
    </tr>
    <tr>
      <td>2009</td>
      <td>0.57</td>
      <td>0.43</td>
    </tr>
  <p>
    Note:
    <ul>
      <li>Use condition if customers not has transaction below 3 month (90 days)</li>
    </ul>
  <p>
</div>

