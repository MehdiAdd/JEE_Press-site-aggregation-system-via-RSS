package com.mdad;

import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.sun.syndication.feed.synd.SyndCategory;
import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.SyndFeedOutput;
import com.sun.syndication.io.XmlReader;

@SpringBootApplication
public class MiniProjetV1Application {

	public static void main(String[] args)   {
		SpringApplication.run(MiniProjetV1Application.class, args);
		
		
	/*	URL feedSource;
		try {
			feedSource = new URL("https://lifehacker.com/rss");
			SyndFeedInput input = new SyndFeedInput();
			
			SyndFeed feed = input.build(new XmlReader(feedSource));
			List<SyndEntry> list=(List<SyndEntry>)feed.getEntries();
			for(SyndEntry e : list) {
				SyndContent c=e.getDescription();
				System.out.println("\n\nAuteur :"+e.getAuthor()+" \ndesc= "+c.getValue() +"\n LINK "+e.getLink()+"\n PUBDSTE "+e.getPublishedDate());
				List <SyndCategory> listCategoeies =e.getCategories();
				System.out.println("\n  Categories :");
				for(SyndCategory ca : listCategoeies) {
						System.out.println("    "+ca.getName());
				}
			}
			Writer writer = new FileWriter("feed.xml");
			SyndFeedOutput syndFeedOutput = new SyndFeedOutput();
			syndFeedOutput.output(feed, writer);
			writer.close();
			 String feed1 = "feed.xml";
				       FileInputStream fis = new FileInputStream(feed1);

				       SyndFeedInput input1 = new SyndFeedInput();
				       SyndFeed sf = input1.build(new XmlReader(fis));
						List<SyndEntry> list1=(List<SyndEntry>)sf.getEntries();
						for(SyndEntry e : list1) {
							SyndContent c1=e.getDescription();
							System.out.println("\n\nAuteur :"+e.getAuthor()+" \ndesc= "+e.getDescription().getValue() +"\n LINK "+e.getLink()+"\n PUBDSTE "+e.getPublishedDate());
							List <SyndCategory> listCategoeies =e.getCategories();
							System.out.println("\n  Categories :");
							for(SyndCategory ca : listCategoeies) {
									System.out.println("    "+ca.getName());
							}
						}
			
			
		} catch (IOException | IllegalArgumentException | FeedException e1) {
			System.out.println("URL not FOUND");
		}
	
		
		*/
		
		
	}

}
