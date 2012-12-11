-- Proving that List is a Monad.

import MonadRules

allProofs = and [ proof1
                , proof2 ([] :: [Int])
                , proof2 [1]
                , proof2 [1..10]
                , proof3 ([] :: [Int])
                , proof3 [1]
                , proof3 [1..10] ]


proof1 :: Bool
proof1 = rule1 1 (: [])

proof2 :: Eq a => [a] -> Bool
proof2 = rule2

proof3 :: Eq a => [a] -> Bool
proof3 a = rule3 a (: a) (: a)
