import json
from typing import Optional

from physical_characteristics.Eye.EyeColors import EyeColors
from physical_characteristics.Eye.EyeShapes import EyeShapes


class Eye:

    def __init__(self, has_left_eye: bool, has_right_eye: bool, eye_color: Optional[EyeColors] = None,
                 eye_shape: Optional[EyeShapes] = None):
        self.has_left_eye = has_left_eye
        self.has_right_eye = has_right_eye
        self.eye_color = eye_color
        self.eye_shape = eye_shape

    def __str__(self) -> str:
        return json.dumps(self.__dict__)
