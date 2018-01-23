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

<p>If you want to use the file, please update your spreadsheet key in the <strong>spreadsheet.rb</strong> script.</p>

<p>Please install the gem `email_address` as I use to check if the scrapped adress are valid<./p>
<p>To do so, type gem install email_address in your terminal.</p>

<p>I also used the dotenv gem in order to hide my mail account keys. I also advise you to create a .env file in the folder with the following lines:</p>

<p>username ="your_username</p>
<p>password ="your_password"</p>

<p>And do not forget to install the gem if you do not currently use it.</p>

<h1>How to use the program ?</h1>
<p>Just launch send_emails.rb and follow the indications.</p>
<p>Have fun spamming France's townhall :)</p>
