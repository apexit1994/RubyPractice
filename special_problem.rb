def specialProblem (noc, ppp, array)
    i = probs = special_problem = 0
    page_num=1
    while i < noc 
        if probs >= array[i]
            i += 1
            probs = 0
        end
        probs += ppp
        page_num += 1
        if (page_num <= probs) && (page_num >= probs-(noc-1))
            special_problem += 1
        end
    end
    return special_problem
end

puts specialProblem 4, 4, [12, 26, 3 , 13]
    