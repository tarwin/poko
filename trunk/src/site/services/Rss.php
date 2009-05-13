<?="<?xml version=\"1.0\" encoding=\"UTF-8\"?>" ?>
<rss version="2.0">
	<channel>
		<title><?=$data->title?></title>
		<description><?=$data->description?></description>
		<generator><?=$data->generator?></generator>
		<link><?=$data->link?></link>
		
		<? foreach(iterate($data->items) as $item){ ?>
		<item>
			<title><?=$item->title?></title>
			<description><![CDATA[<?=$item->description?>]]></description>
			<link><?=$item->link?></link>
			<guid><?=$item->guid?></guid>
			<pubDate><?=$item->pubdate?></pubDate>
		</item>
		<? } ?>
			
	</channel>
</rss>