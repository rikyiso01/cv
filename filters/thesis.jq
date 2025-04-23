.education |= [.[]|select(
    .studyType=="bachelors"
    # or .studyType=="master"
    or .institution=="ZenHack"
    or .title=="Silicon Valley Study Tour"
    or .title=="International Collegiate Programming Contest"
    or .title=="Leonardo Unige Scholarship Program 2022/2023"
)] | .work |= [.[]|select(
    .name=="Consorzio Ruvaris"
    or .position=="Research grant"
)] | .volunteer |= [.[]|select(
    .title=="Cyberchallenge.it teacher"
    or .title=="FLL Coach"
)]
