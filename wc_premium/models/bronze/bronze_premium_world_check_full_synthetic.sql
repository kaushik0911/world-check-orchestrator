SELECT
    uid,
    last_name,
    first_name,
    aliases,
    low_quality_aliases,
    alternative_spelling,
    category,
    title,
    `sub-category` AS sub_category,
    position,
    age,
    dob as date_of_birth,
    dobs as date_of_births,
    place_of_birth,
    deceased,
    passports,
    ssn,
    identification_numbers,
    locations,
    countries,
    citizenship,
    companies,
    `e/i` AS e_i,
    linked_to,
    further_information,
    keywords,
    external_sources,
    update_category,
    case
        when entered is not null
            and entered <> ''
            and length(entered) = 10
        then toDate(entered, 'UTC')
        else
            null
    end as created_at,
    case
        when updated is not null
            and updated <> ''
            and length(updated) = 10
        then toDate(updated, 'UTC')
        else
            null
    end as updated_at,
    editor,
    `age_date_(as_of_date)` as age_date,
    pep_roles,
    pep_status,
    special_interest_categories
FROM `premium-world-check-full-synthetic`
