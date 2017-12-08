readFromXML <-
function(){
        fileURL <- "http://www.w3schools.com/xml/simple.xml"
        doc <- xmlTreeParse(fileURL, useInternal=TRUE)
        rootNode <- xmlRoot(doc)
        xmlName(rootNode)
}
