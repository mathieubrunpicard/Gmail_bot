<h1>Playing with Ruby's Gmail gem</h1>

<h2>This program is composed in two parts</h2>
<ol>
  <li>Scrapping tool</li>
  <li>Mail bot</li>
</ol>

<h3>Scrapping tool</h3>
<p>The scrapping tool get a french department as an input (i.e. between 01 and 95, including 971, 972, 973 and 974).</p>
<p>Then it returns a file "townhall.json" containing all the townhalls name and contact e-mail adress</p>
<p>It also saves the data in a spreadsheet</p>
<p>I decided to work with a json, as the execution speed is <em>higher</em> on my laptop</p>

<h3>Mail bot</h3>

<p>The mail bot asks you if you want to send a predifinite email.</p>
<p>If you press Yes, then the bot will send the mail to the whole townhall of the selected department.</p>

