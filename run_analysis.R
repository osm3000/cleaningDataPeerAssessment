# step 1-2: merges the training and the test datasets
readData <- function(path.prefix, file) {
    # read features, labels, subject into R
    feature.loc <- paste0('./', path.prefix, '/', 'X_', file, '.txt')
    features <- read.table(feature.loc)

    label.loc <- paste0('./', path.prefix, '/', 'y_', file, '.txt')
    label <- read.table(label.loc)

    subject.loc <- paste0('./', path.prefix, '/', 'subject_', file, '.txt')
    subject <- read.table(subject.loc)
    
    # Names of features
    feature.names <- read.table('features.txt', stringsAsFactors = FALSE)
    feature.names <- feature.names[,2]

    # select columns measuring mean/std
    col.idx <- grep('mean\\(\\)|std\\(\\)', feature.names)

    data <- cbind(subject, features[ ,col.idx], label)
    names(data) <- c('Activity', 'SubjectID',feature.names[col.idx])
    data
}

mergeData <- function() {
    train <- readData('train', 'train')
    test <- readData('test', 'test')
    all <- rbind(train, test)
    all
}

# step 3 
betterColNames <- function(col.names) {
    col.names <- gsub('mean\\(\\)', 'Mean', col.names)
    col.names <- gsub('std\\(\\)', 'Std', col.names)
    col.names <- gsub('-', '', col.names)
    col.names
}

# step 4
applyActivityNames <- function(data) {
    activities <- read.table('activity_labels.txt', col.names = c('Activity', 'ActivityName'), )
    data <- merge(activities, data)
    data$Activity <- NULL
    data
}

# combine first four steps
getTidyData <- function() {
    all <- mergeData()
    names(all) <- betterColNames(names(all))
    all <- applyActivityNames(all)
    all
}

# aggregated to the subject and activity level
getAggregatedData <- function(data){
    aggregated <- aggregate(. ~ ActivityName + SubjectID, data = data, FUN = mean)
    aggregated
}

writeTidyData <- function(tidy.file1, tidy.file2){
    data <- getTidyData()
    write.table(data, file = tidy.file1, quote = FALSE)
    aggregated <- getAggregatedData(data)
    write.table(aggregated, file = tidy.file2, quote = FALSE)
}

writeTidyData('tidy1.txt', 'tidy2.txt') 
