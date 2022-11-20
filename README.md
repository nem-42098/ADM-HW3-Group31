# ADM-HW3-Group31
This repository represents the solutions for the third homework of the ADM course. The codes are developed by Group #31 with the following members:

Nemish Murawat, 2056142

Paolo Leoni, 1894985

Anthony Ballerino, 2073280

The subject of this homework is a data set collected through scraping information from the following website: https://www.atlasobscura.com/places?sort=likes_count. The scraped data has been saved in both csv. and tsv. format and describes essentially for each location which is of cultural interest, some statistics present on the website, like then number of people who visited that location or would like to.

## Contents

**Main.ipynb** :<br> The solutions for Q1 to Q5 and Q7(excluding Map Reduce) are written in Python and developed on Jupyterlabs(Anaconda). <br>
Caveat: To run the .ipynb files without error, the needed datasets are present in the *Dataset* folder. <br>
<br> For the bonus question, we did not provide the inverted index and vocabulary dataset explicitly.The implementation in this scenario deals with not that large number of documents and you can run the section associated with the bonus part to get the inverted_index and vocabulary. The expected time to get all the three required inverted_index and vocabulary is less than 1 min.
<br> We developed the Map Reduce part of Q7 using *AWS-SageMaker* emr instance <br>.
<br> The rendered format of the Main.ipynb can be found here [Main](https://nbviewer.org/github/nem-42098/ADM-HW3-Group31/blob/main/Main.ipynb)<br>


**CommandLineQuestion.sh** :<br> The solution to the command line question. The solution was developed in MacOS, so to run it over windows you need to install [Git](https://gitforwindows.org/) and use GIT Bash to run it.

**Dataset/Full_DAtaset_Cleaned-v2.csv** : <br> This is the Main Dataset which contains features extracted from all the 7200 places from most popular place present on [Atlasobscura](https://www.atlasobscura.com/places?sort=likes_count). The decription of the features are as follows:

1. Place Name (to save as `placeName`): String.
2. Place Tags (to save as `placeTags`): List of Strings.
3. \# of people who have been there (to save as `numPeopleVisited`): Integer.
4. \# of people who want to visit the place(to save as `numPeopleWant`): Integer.
5. Description (to save as `placeDesc`): String. Everything from under the first image up to "know before you go" (orange frame on the example image).
6. Short Description (to save as `placeShortDesc`): String. Everything from the title and location up to the image (blue frame on the example image).
7. Nearby Places (to save as `placeNearby`): Extract the names of all nearby places, but only keep unique values: List of Strings.
8. Address of the place(to save as `placeAddress`): String.
9. Latitud and Longitude of the place's location(to save as `placeAlt` and `placeLong`): Floats
10. The username of the post editors (to save as `placeEditors`): List of Strings.
11. Post publishing date (to save as `placePubDate`): datetime.
12. The names of the lists that the place was included in (to save as `placeRelatedLists`): List of Strings.
13. The names of the related places (to save as `placeRelatedPlaces`): List of Strings.
14. The URL of the page of the place (to save as `placeURL`):String

The file is stored in *.csv* format.
