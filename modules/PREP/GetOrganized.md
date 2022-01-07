---
layout: page
title: Preparation Guide
subtitle: Getting Organized
css: /css/modules.css
---

## Prepare Software/Apps
The following apps should be initiated before the first day of class.

* [MS Teams Course Site](RESOURCES/MSTeams_Intro){:target="_blank"}
    * Note that there is a short assignment at the end of this description that should  be completed before the first day of class.
* [Gradescope Grading Site](RESOURCES/Gradescope_Intro){:target="_blank"}
    * You should have received an e-mail from me inviting you to activate a GradeScope account and join this class. Make sure to follow the directions in that e-mail. Contact me if you did not get that e-mail.

If you plan to use your own computer to run R/RStudio then you should complete the following items before the first day of class. Note the required version numbers below. If you have previously installed these softwares then you may need to update them. If you plan to use the college computers you do not need to do the next four items.

* Install R (*at least v 4.0.0*) ... [for Windows](https://cran.r-project.org/bin/windows/base/R-4.0.3-win.exe) ... [for Macs](https://cran.r-project.org/bin/macosx/R-4.0.3.pkg) ... *just accept defaults*
* Install RStudio (*at least v 1.3.0*) ... [Choose Windows/Mac here](https://rstudio.com/products/rstudio/download/#download){:target="_blank"} ... *just accept defaults*
* Install FSA (*at least v 0.9.1*) ... in RStudio, select the "Packages" tab in one of the panes (likely lower right), press the "Install" button, type "FSA" (without the quotes) under "Packages" in the dialog box, press the "Install" button, and be patient as several packages are installed. 
* Install FSASim ... copy-and-paste the following three lines into the "Console" of RStudio (and hit return)

```
if (!require('manipulate')) utils::install.packages('manipulate')
if (!require('remotes')) install.packages('remotes'); require('remotes')
remotes::install_github('droglenc/FSASim',type='binary')
```

* Install Microsoft Word and Excel (from the Office 365 Suite) ... [follow these directions](https://my.northland.edu/campus-life/campus-services/technology/#accessing-installing-office-365){:target="_blank"}
    * The web-based versions of Excel and Word are not adequate for our purposes; you need the "full" versions.
    * This software is free to Northland students as described in the link.

<br>

Regardless if you use your own computer or not, you should do the following before the first day of class.

* Create a folder where you will save all of your work (especially R work) for this course this semester. If you are using the College's computers I suggest creating this folder on the "T:/" drive.

Contact me if you have any issues with any of the above items.

&nbsp;

## Understand the Homework Format
I have very specific expectations for your homework assignment reports. These expectations and requirements are described below. [A document that demonstrates several of these expectations is here](RESOURCES/HWFormat_Example.pdf){:target="_blank"} (note the comments in "balloons").

1. Each document should be typed, converted to a PDF, and submitted to the proper item on [GradeScope](../).
1. Long hand-calculations can be made in a hand-written appendix that is included in your PDF document to submit (perhaps take a picture of it and then insert that picture into your document before making the PDF).
1. Each document should include the following statement along with your signature -- "*I have neither given nor received unauthorized aid in completing this work, nor have I presented someone else's work as my own.*"
1. Your document should "look nice." This means that you should include spaces that increase readability (e.g., between a paragraph and a table). In addition, you should not use "non-standard" fonts -- the most common of which is "comic sans." Scientific presentations require a "serious" font which is likely one of "Times New Roman", "Arial", "Calibri", or "Helvetica." The one exception to this is the use of the "Courier" for results from R/RStudio (see below).
1. You should use complete sentences whenever possible. This may result in very simple sentences -- e.g., "The sample mean is 3.26 (Table 1)." -- but should become your default.
1. You should provide evidence for each factual statement that you make. Most of the time this means that you will be referring to a particular figure or table. It is inappropriate to say "in the table below", for example. Instead you should say "as seen in Table 1" or put "(Table 1)" at the end of a sentence. Tables and figures should then be properly labeled (see below).
1. Tables and figures should be properly labeled. There are a wide variety of proper styles for labeling figures and tables. The most common styles label tables **ON TOP** of the table and figures **BELOW** the figure. The labels should use "Table" or "Figure" (note that "Graph" and "Chart" are unacceptable), should include a sequential number (the first of each table or figure is numbered "1" and each subsequent table or figure has an increased number), and a descriptive label. Descriptive labels are **descriptive** -- i.e., "Table 1. Summary statistics of data." is inadequate, "Table 1.  Summary statistics of the length of ant antennae separated by sex." is much better.
1. R/RStudio output (usually as a table) should be converted to "Courier" or "Courier (New)" font. This is the font used by R/RStudio and, thus, will force the items in the table to "line up." This will save you from having to include spaces or tabs to make items line up. All other text should be in the fonts mentioned previously.
1. Where appropriate, Greek letters should be changed to their symbol equivalent.  In other words, it is better to use &alpha; than "alpha."
1. Every assignment that uses R/RStudio should include an appendix that lists the script of R/RStudio commands used to produce the analyses (i.e., the code from your RStudio script window). This script should contain only good code (i.e., no errors) and should not include any code that produce errors or was not used in your analysis. If I had the data for the assignment, I should be able to copy your appendix, paste it into R/RStudio, and have it run without any issues.

&nbsp;

## Prepare Content
Please do the following things in preparation for the first day of class.

* [Complete Webpage Scavenger Hunt](RESOURCES/GetOrganized_Hunt){:target="_blank"}
    * You should have written answers to these questions when you come to class.
