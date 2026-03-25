import feedparser
import xml.etree.ElementTree as ET


def main():
    url = "https://vgames.co.il/rss"
    feed = feedparser.parse(url)
    for entry in feed.entries:
        print(f"Title: {entry.title}")
        print(f"Link: {entry.link}")
        print(f"Description: {entry.description}")
        image = (
            ET.fromstring(entry.get("summary", "")).find(".//img").get("src") # ty: ignore[unresolved-attribute]
            if entry.get("summary")
            else None
        )
        print(f"Image: {image}")
        print("-" * 40)


if __name__ == "__main__":
    main()
