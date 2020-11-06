---
title       : A shiny data app
subtitle    : Fuel consumption of cars
author      : Marbo87   
job         : student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Content

1. Introduction
2. What the app is about and how it works
3. Example

--- .class #id 

## Introduction

The purpose of this presentation is 2-fold.

1. Learn how to create presentations, in this case with slidify, and provide them online, e.g., via github pages. Thus, everybody how is interested can get access easily.

2. Learn how to create an application with shiny, which is especially useful for providing data results and using data interactively. 

Data from the library *AppliedPredictiveModeling*, denoted *FuelEconomy*, is used.

--- .class #id 

## What the app is about and how it works

The accompanying app is about the fuel efficiency in miles per gallon of cars in dependence on engine displacement. There are three inputs for the user:

1. The data of cars can be chosen to be from the year 2011 or 2012 with a radio button.
2. Besides the actual data points, lines from two regression models are plotted: a) a linear model and b) a quadratic model. Here the user can chose on which line to plot a point. 
3. Furthermore, the x-value of that point can be chosen, whose y-value is displayed also in the side panel at the bottom.

--- .class #id 

## Example
![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png)
The car data from 2011 are presented. Besides the actual data and the lines of the two models, a point for x = 5 on the linear model is shown. The y-value of the point is 27.58

