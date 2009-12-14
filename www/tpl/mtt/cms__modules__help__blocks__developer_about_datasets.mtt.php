<?php

$this->buf .= '<h3>About: Datasets</h3>

<p>
A Dataset is the combination of defined metadata and a relation database table. In the "Manage" Section of "Data" you can setup you definitions. 
</p>

<h4>Defining a definition</h4>
<p>
You need to first define your databse table using something like PhpMyAdmin. Tables which do not have a definition (and are therefore not available as datasets) display in the "undefined tables" list. <br/>
When you click "define" on a table, it will move to the top section. You can now "edit" it to add field definitions and other information.
</p>

<h4>Dataset Properties</h4>
<p>
In the top section you can define overall properties of the dataset:<br/>
	<b>label: </b> Give the field a more user friendly name.<br/>
	<b>Show in list: </b> Shows the field in the CRUB table preview page.<br/>
	<b>Show in filter: </b> Allows you to filter the dataset\'s results on this field<br/>
	<b>Show in ordering: </b> Allows you to order the dataset\'s results on this field<br/>
</p>


<h4>Defining elements</h4>
<p>
To allow used to acces and add data to the dataset, you need to define its elements. Click define on \'undefined\' fields in the bottom section, as before. <br/>
You can give varios typed of definitions to a field. see <a href="?request=cms.modules.help.Help&topic=developer_fieldDefinitions">Field Definitions</a>
</p>
';

?>