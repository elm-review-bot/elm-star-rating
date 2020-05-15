{-
   Copyright 2018 Ford Motor Company

     Licensed under the Apache License, Version 2.0 (the "License");
     you may not use this file except in compliance with the License.
     You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

     Unless required by applicable law or agreed to in writing, software
     distributed under the License is distributed on an "AS IS" BASIS,
     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
     See the License for the specific language governing permissions and
     limitations under the License.
-}


module Internal.Helpers exposing (chooseCharacter, generateRatingList, ratingToBoolean, updateRenderedRating)

import Html exposing (Html)
import Internal.Model as Internal
import Msg exposing (Msg)


ratingToBoolean : Int -> Int -> Bool
ratingToBoolean index rating =
    if rating > index then
        True

    else
        False


chooseCharacter : Bool -> Internal.Model -> Html Msg
chooseCharacter filled model =
    if filled then
        model.filledStar

    else
        model.emptyStar


generateRatingList : Int -> List Bool
generateRatingList rating =
    List.indexedMap (\index _ -> ratingToBoolean index rating) (List.repeat 5 "")


updateRenderedRating : Internal.Model -> Int -> Internal.Model
updateRenderedRating model enteredRating =
    if model.rating > enteredRating then
        { model | renderedRating = model.rating }

    else
        { model | renderedRating = enteredRating }
