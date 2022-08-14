//
//  TestConstants.swift
//  CaseMovieTests
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation

struct TestConstants {
    struct MockStrings {
        static let movieDetail = """
        {"adult":false,"backdrop_path":"/odJ4hx6g6vBt4lBWKFD1tI8WS4x.jpg","belongs_to_collection":{"id":531330,"name":"Top Gun Collection","poster_path":"/wtpIx0Gsra1IGHH8af5kNK90Xy8.jpg","backdrop_path":"/9MGm0XT04ob99MyGQfMT7I8y3UE.jpg"},"budget":170000000,"genres":[{"id":28,"name":"Action"},{"id":18,"name":"Drama"}],"homepage":"https://www.topgunmovie.com","id":361743,"imdb_id":"tt1745960","original_language":"en","original_title":"Top Gun: Maverick","overview":"After more than thirty years of service as one of the Navy’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.","popularity":3952.536,"poster_path":"/62HCnUTziyWcpDaBO2i1DX17ljH.jpg","production_companies":[{"id":4,"logo_path":"/gz66EfNoYPqHTYI4q9UEN4CbHRc.png","name":"Paramount","origin_country":"US"},{"id":10288,"logo_path":null,"name":"Don Simpson/Jerry Bruckheimer Films","origin_country":"US"},{"id":82819,"logo_path":"/zlFa3VNua4hJyGEI4X2sqDrtEH9.png","name":"Skydance Media","origin_country":"US"}],"production_countries":[{"iso_3166_1":"US","name":"United States of America"}],"release_date":"2022-05-24","revenue":1354000000,"runtime":131,"spoken_languages":[{"english_name":"English","iso_639_1":"en","name":"English"}],"status":"Released","tagline":"Feel the need... The need for speed.","title":"Top Gun: Maverick","video":false,"vote_average":8.339,"vote_count":1877}
        """
        static let popularMoviesPage1 = """
        {"page":1,"results":[{"adult":false,"backdrop_path":"/7ZO9yoEU2fAHKhmJWfAc2QIPWJg.jpg","genre_ids":[28,53,878],"id":766507,"original_language":"en","original_title":"Prey","overview":"When danger threatens her camp, the fierce and highly skilled Comanche warrior Naru sets out to protect her people. But the prey she stalks turns out to be a highly evolved alien predator with a technically advanced arsenal.","popularity":12286.389,"poster_path":"/ujr5pztc1oitbe7ViMUOilFaJ7s.jpg","release_date":"2022-08-02","title":"Prey","video":false,"vote_average":8.2,"vote_count":2137},{"adult":false,"backdrop_path":"/p1F51Lvj3sMopG948F5HsBbl43C.jpg","genre_ids":[28,12,14],"id":616037,"original_language":"en","original_title":"Thor: Love and Thunder","overview":"After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.","popularity":8421.992,"poster_path":"/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg","release_date":"2022-07-06","title":"Thor: Love and Thunder","video":false,"vote_average":6.8,"vote_count":1819},{"adult":false,"backdrop_path":"/9eAn20y26wtB3aet7w9lHjuSgZ3.jpg","genre_ids":[12,28,878],"id":507086,"original_language":"en","original_title":"Jurassic World Dominion","overview":"Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history’s most fearsome creatures.","popularity":5430.951,"poster_path":"/kAVRgw7GgK1CfYEJq8ME6EvRIgU.jpg","release_date":"2022-06-01","title":"Jurassic World Dominion","video":false,"vote_average":7.1,"vote_count":2728},{"adult":false,"backdrop_path":"/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg","genre_ids":[10751,16,12,35,14],"id":438148,"original_language":"en","original_title":"Minions: The Rise of Gru","overview":"A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.","popularity":5159.462,"poster_path":"/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg","release_date":"2022-06-29","title":"Minions: The Rise of Gru","video":false,"vote_average":7.8,"vote_count":1304},{"adult":false,"backdrop_path":"/odJ4hx6g6vBt4lBWKFD1tI8WS4x.jpg","genre_ids":[28,18],"id":361743,"original_language":"en","original_title":"Top Gun: Maverick","overview":"After more than thirty years of service as one of the Navy’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.","popularity":4440.063,"poster_path":"/62HCnUTziyWcpDaBO2i1DX17ljH.jpg","release_date":"2022-05-24","title":"Top Gun: Maverick","video":false,"vote_average":8.3,"vote_count":1885},{"adult":false,"backdrop_path":"/sKvQUSyqsFq8e1ts6oo3Xp3dPH2.jpg","genre_ids":[16,12,35,14],"id":585511,"original_language":"en","original_title":"Luck","overview":"Suddenly finding herself in the never-before-seen Land of Luck, the unluckiest person in the world must unite with the magical creatures there to turn her luck around.","popularity":3368.568,"poster_path":"/1HOYvwGFioUFL58UVvDRG6beEDm.jpg","release_date":"2022-08-05","title":"Luck","video":false,"vote_average":8.2,"vote_count":325},{"adult":false,"backdrop_path":"/AfvIjhDu9p64jKcmohS4hsPG95Q.jpg","genre_ids":[27,53],"id":756999,"original_language":"en","original_title":"The Black Phone","overview":"Finney Shaw, a shy but clever 13-year-old boy, is abducted by a sadistic killer and trapped in a soundproof basement where screaming is of little use. When a disconnected phone on the wall begins to ring, Finney discovers that he can hear the voices of the killer’s previous victims. And they are dead set on making sure that what happened to them doesn’t happen to Finney.","popularity":3232.759,"poster_path":"/p9ZUzCyy9wRTDuuQexkQ78R2BgF.jpg","release_date":"2022-06-22","title":"The Black Phone","video":false,"vote_average":8,"vote_count":1771},{"adult":false,"backdrop_path":"/nW5fUbldp1DYf2uQ3zJTUdachOu.jpg","genre_ids":[16,878,12,28,10751],"id":718789,"original_language":"en","original_title":"Lightyear","overview":"Legendary Space Ranger Buzz Lightyear embarks on an intergalactic adventure alongside a group of ambitious recruits and his robot companion Sox.","popularity":2361.425,"poster_path":"/ox4goZd956BxqJH6iLwhWPL9ct4.jpg","release_date":"2022-06-15","title":"Lightyear","video":false,"vote_average":7.3,"vote_count":1598},{"adult":false,"backdrop_path":"/wcKFYIiVDvRURrzglV9kGu7fpfY.jpg","genre_ids":[14,28,12],"id":453395,"original_language":"en","original_title":"Doctor Strange in the Multiverse of Madness","overview":"Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.","popularity":2350.047,"poster_path":"/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg","release_date":"2022-05-04","title":"Doctor Strange in the Multiverse of Madness","video":false,"vote_average":7.5,"vote_count":5226},{"adult":false,"backdrop_path":"/27Mj3rFYP3xqFy7lnz17vEd8Ms.jpg","genre_ids":[28,53],"id":725201,"original_language":"en","original_title":"The Gray Man","overview":"When a shadowy CIA agent uncovers damning agency secrets, he's hunted across the globe by a sociopathic rogue operative who's put a bounty on his head.","popularity":1990.844,"poster_path":"/8cXbitsS6dWQ5gfMTZdorpAAzEH.jpg","release_date":"2022-07-13","title":"The Gray Man","video":false,"vote_average":7.1,"vote_count":1503},{"adult":false,"backdrop_path":"/rLo9T9jEg67UZPq3midjLnTUYYi.jpg","genre_ids":[10402,18,36],"id":614934,"original_language":"en","original_title":"Elvis","overview":"The life story of Elvis Presley as seen through the complicated relationship with his enigmatic manager, Colonel Tom Parker.","popularity":1727.135,"poster_path":"/qBOKWqAFbveZ4ryjJJwbie6tXkQ.jpg","release_date":"2022-06-22","title":"Elvis","video":false,"vote_average":7.9,"vote_count":938},{"adult":false,"backdrop_path":"/l99dylTOAMkwKSr54X5ytiEtnLA.jpg","genre_ids":[14,12,28],"id":919355,"original_language":"en","original_title":"Dragon Knight","overview":"Many years after the war has been lost, and all the dragons slain, a lone knight travels the lands of Agonos seeking to raise an army against the demon lord Abaddon. When a healer's vision reveals that one dragon still lives, and together with an eager young squire, the knight sets off in search of the fabled creature. As the armies of Abaddon descend on the human kingdoms, the dragon is their last hope of fending off the horde, before it lays waste to the lands of men. But does the creature even exist? And if it does, will it fight for them once more?","popularity":1694.611,"poster_path":"/uSMJbYhaEpQtF9vkMhpgljc0CA4.jpg","release_date":"2022-03-21","title":"Dragon Knight","video":false,"vote_average":7.3,"vote_count":20},{"adult":false,"backdrop_path":"/ocUp7DJBIc8VJgLEw1prcyK1dYv.jpg","genre_ids":[28,12,878],"id":634649,"original_language":"en","original_title":"Spider-Man: No Way Home","overview":"Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.","popularity":1590.428,"poster_path":"/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg","release_date":"2021-12-15","title":"Spider-Man: No Way Home","video":false,"vote_average":8,"vote_count":14626},{"adult":false,"backdrop_path":"/5PnypKiSj2efSPqThNjTXz8jwOg.jpg","genre_ids":[14,28],"id":759175,"original_language":"en","original_title":"The Princess","overview":"A beautiful, strong-willed young royal refuses to wed the cruel sociopath to whom she is betrothed and is kidnapped and locked in a remote tower of her father’s castle. With her scorned, vindictive suitor intent on taking her father’s throne, the princess must protect her family and save the kingdom.","popularity":1571.121,"poster_path":"/9pCoqX24a6rE981fY1O3PmhiwrB.jpg","release_date":"2022-06-16","title":"The Princess","video":false,"vote_average":7,"vote_count":424},{"adult":false,"backdrop_path":"/8wwXPG22aNMpPGuXnfm3galoxbI.jpg","genre_ids":[28,12,10751,35],"id":675353,"original_language":"en","original_title":"Sonic the Hedgehog 2","overview":"After settling in Green Hills, Sonic is eager to prove he has what it takes to be a true hero. His test comes when Dr. Robotnik returns, this time with a new partner, Knuckles, in search for an emerald that has the power to destroy civilizations. Sonic teams up with his own sidekick, Tails, and together they embark on a globe-trotting journey to find the emerald before it falls into the wrong hands.","popularity":1520.845,"poster_path":"/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg","release_date":"2022-03-30","title":"Sonic the Hedgehog 2","video":false,"vote_average":7.7,"vote_count":2756},{"adult":false,"backdrop_path":"/ftGzl2GCyko61Qp161bQElN2Uzd.jpg","genre_ids":[28,53],"id":961484,"original_language":"en","original_title":"Last Seen Alive","overview":"After Will Spann's wife suddenly vanishes at a gas station, his desperate search to find her leads him down a dark path that forces him to run from authorities and take the law into his own hands.","popularity":1507.651,"poster_path":"/qvqyDj34Uivokf4qIvK4bH0m0qF.jpg","release_date":"2022-05-19","title":"Last Seen Alive","video":false,"vote_average":6.5,"vote_count":219},{"adult":false,"backdrop_path":"/iQlJyRecJeGGzQGT2rEcyAgz89F.jpg","genre_ids":[10749,18],"id":762975,"original_language":"en","original_title":"Purple Hearts","overview":"An aspiring musician agrees to a marriage of convenience with a soon-to-deploy Marine, but a tragedy soon turns their fake relationship all too real.","popularity":1506.48,"poster_path":"/4JyNWkryifWbWXJyxcWh3pVya6N.jpg","release_date":"2022-07-29","title":"Purple Hearts","video":false,"vote_average":8.6,"vote_count":1026},{"adult":false,"backdrop_path":"/4dNv1W1KMSLdYGz0tCEaynF0E4Q.jpg","genre_ids":[28,53,80],"id":854467,"original_language":"en","original_title":"Indemnity","overview":"An ex-fireman with PTSD goes on the run when accused of a crime he doesn't even remember committing, leading him down a rabbit hole of conspiracy to the highest degree.","popularity":1425.53,"poster_path":"/tVbO8EAbegVtVkrl8wNhzoxS84N.jpg","release_date":"2022-02-11","title":"Indemnity","video":false,"vote_average":7,"vote_count":50},{"adult":false,"backdrop_path":"/jazlkwXfw4KdF6fVTRsolOvRCmu.jpg","genre_ids":[53],"id":924482,"original_language":"en","original_title":"The Ledge","overview":"A rock climbing adventure between two friends turns into a terrifying nightmare. After Kelly captures the murder of her best friend on camera, she becomes the next target of a tight-knit group of friends who will stop at nothing to destroy the evidence and anyone in their way. Desperate for her safety, she begins a treacherous climb up a mountain cliff and her survival instincts are put to the test when she becomes trapped with the killers just 20 feet away.","popularity":1421.047,"poster_path":"/dHKfsdNcEPw7YIWFPIhqiuWrSAb.jpg","release_date":"2022-02-18","title":"The Ledge","video":false,"vote_average":6.3,"vote_count":77},{"adult":false,"backdrop_path":"/uR0FopHrAjDlG5q6PZB07a1JOva.jpg","genre_ids":[16,878,28],"id":610150,"original_language":"ja","original_title":"ドラゴンボール超：スーパーヒーロー","overview":"The Red Ribbon Army, an evil organization that was once destroyed by Goku in the past, has been reformed by a group of people who have created new and mightier Androids, Gamma 1 and Gamma 2, and seek vengeance against Goku and his family.","popularity":1390.006,"poster_path":"/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg","release_date":"2022-06-11","title":"Dragon Ball Super: Super Hero","video":false,"vote_average":7.5,"vote_count":99}],"total_pages":34714,"total_results":694261}
        """
    }
}
