.education |= [.[]|select(
    .studyType=="bachelors"
    or .studyType=="high school"
    or .studyType=="master"
    or .institution=="ZenHack"
    or .title=="Silicon Valley Study Tour"
    or .title=="International Collegiate Programming Contest"
    or .title=="Leonardo Unige Scholarship Program 2022/2023"
    or .title=="Cyberchallenge.it"
)] | .work |= [.[]|select(
    .name=="Consorzio Ruvaris"
    or .position=="Docente"
    or .position=="Ricercatore"
)] | .volunteer |= [.[]|select(
    .title=="Docente Cyberchallenge.it"
)] | .languages |= [.[]|select(
    .language=="Inglese"
)]
