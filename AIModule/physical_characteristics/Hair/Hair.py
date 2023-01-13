from typing import Optional
from physical_characteristics.Hair.HairColors import HairColors
from physical_characteristics.Hair.HairLenghts import HairLenghts

import json

from physical_characteristics.Hair.HairTypes import HairTypes


class Hair:

    def __init__(self, has_hair: bool, color: Optional[HairColors] = None, type: Optional[HairTypes] = None,
                 length: Optional[HairLenghts] = None):
        self.has_hair = has_hair
        self.color = color
        self.type = type
        self.length = length

    def __str__(self) -> str:
        return json.dumps(self.__dict__)
