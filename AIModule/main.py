from physical_characteristics.Eye.Eye import Eye
from physical_characteristics.Eye.EyeColors import EyeColors
from physical_characteristics.Eye.EyeShapes import EyeShape
from physical_characteristics.Hair.Hair import Hair
from physical_characteristics.Hair.HairColors import HairColors
from physical_characteristics.Hair.HairLenghts import HairLenght
from physical_characteristics.Hair.HairTypes import HairType


"""
To make like/skip scenarios as realistic as possible based on likes 
physical and mental (such as interests) the most relevant physical characteristics 
and interests are mapped as objects.

Each person in the dataset will be generated with random physical characteristics
and interests, and for each physical characteristic or interest there will be a weight, 
that is, how important the person considers the given characteristic/interest to be in a person to meet.

At the end a sum is made of the characteristics/interests deemed "fundamental" to 
that person if the person met scores >= then they receive a like, 
vice versa they are skipped.

Simplified example:

***NOTE: data are self-generated no discrimination is intended***

Person A:
{
    "Minimal_requirements" : 60pt.
    "Characteristics" {
        "Physical": {
            "Hair" : (has_hair=True, color=HairColors.GREEN, type=HairTypes.STRAIGHT, length=HairLenghts.SHORT)
            "Eye" : (has_left_eye=True, has_right_eye=True, eye_color=EyeColors.GREEN, eye_shape=EyeShapes.ROUND)
        }
        "Interests": {
            "Music" : (likes=True)
            "Movies" : (likes=False)
            "Sports" : (likes=True)
        }  
    }
    
    "Weights" {
        "Physical": {
            "Hair" : {
                "(has_hair=True)": 10pt,
                "(has_hair=False)": 5pt,
                
                if has_hair "Hair_Colors": {
                    (color=HairColors.BLACK) : 5pt.
                    (color=HairColors.BROWN) : 8pt.
                    (color=HairColors.BLONDE) : 10pt.
                    (color=HairColors.RED) : 2pt.
                    (color=HairColors.GREY) : -7pt.
                    (color=HairColors.WHITE) : 5pt.
                    (color=HairColors.PURPLE) : 0pt.
                    (color=HairColors.BLUE) : -5pt.
                    (color=HairColors.GREEN) : -6pt.
                    (color=HairColors.PINK) : -10pt.
                }
                
                if has_hair "Hair_Types": {
                    (color=HairTypes.STRAIGHT) : 5pt.
                    (color=HairTypes.WAVY) : -2pt.
                    (color=HairTypes.CURLY) : 12pt.
                    (color=HairTypes.COILY) : -5pt.
                }
                
                if has_hair "Hair_Lenghts": {
                    (color=HairLenghts.SHORT) : -10pt.
                    (color=HairLenghts.MEDIUM) : 5pt.
                    (color=HairLenghts.LONG) : 50pt.
                }
            }
         
            #Same for Eye and other physical characteristics
            #Same for Interests
        }
    }  
}

Now let's suppose Person A meets 
Person B:
{
    "Minimal_requirements" : 40pt.
    "Characteristics" {
        "Physical": {
            "Hair" : (has_hair=True, color=HairColors.BLONDE, type=HairTypes.STRAIGHT, length=HairLenghts.LONG)
            "Eye" : (has_left_eye=True, has_right_eye=True, eye_color=EyeColors.GREEN, eye_shape=EyeShapes.MONOLID)
        }
        "Interests": {
            "Music" : (likes=True)
            "Movies" : (likes=False)
            "Sports" : (likes=True)
        }  
    }
    
    "Weights" {
        "Physical": {
            "Hair" : {
                "(has_hair=True)": 50pt,
                "(has_hair=False)": -10pt,
                
                if has_hair "Hair_Colors": {
                    (color=HairColors.BLACK) : -2pt.
                    (color=HairColors.BROWN) : 16pt.
                    (color=HairColors.BLONDE) : 12pt.
                    (color=HairColors.RED) : 20pt.
                    (color=HairColors.GREY) : -10pt.
                    (color=HairColors.WHITE) : -10pt.
                    (color=HairColors.PURPLE) : -50pt.
                    (color=HairColors.BLUE) : -4pt.
                    (color=HairColors.GREEN) : 10pt.
                    (color=HairColors.PINK) : -28pt.
                }
                
                if has_hair "Hair_Types": {
                    (color=HairTypes.STRAIGHT) : 15pt.
                    (color=HairTypes.WAVY) : 24pt.
                    (color=HairTypes.CURLY) : 33pt.
                    (color=HairTypes.COILY) : -27pt.
                }
                
                if has_hair "Hair_Lenghts": {
                    (color=HairLenghts.SHORT) : 25pt.
                    (color=HairLenghts.MEDIUM) : 15pt.
                    (color=HairLenghts.LONG) : 0pt.
                }
            }
         
            #Same for Eye and other physical characteristics
            #Same for Interests
        }
    }  
}

The algorithm will calculate the sum of the weights of the characteristics/interests.
Person B has hair, blonde, straight, long, and so on...
The minimum score requirement for person A is 60pt

Person B accumulates the score of:
(has_hair=True) = 10pt
(color=HairColors.BLONDE) = 10pt
(color=HairTypes.STRAIGHT) = 5pt
(color=HairLenghts.LONG) = 50pt
...
10pt + 10pt + 5pt + 50pt + ... = 75pt + ...
As said before the minimum score requirement for person A is 60pt
and the Person B scored 75pt, so Person A will like Person B.

"""


def main():
    print(Hair(has_hair=True, color=HairColors.GREEN, type=HairType.STRAIGHT, length=HairLenght.SHORT))
    print(Eye(has_left_eye=True, has_right_eye=True, eye_color=EyeColors.GREEN, eye_shape=EyeShape.ROUND))


if __name__ == '__main__':
    main()
