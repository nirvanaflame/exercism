pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        if self.health > 0 {
            return None;
        }

        let mana = match self.mana {
            Some(x) => Some(if x == 0 { 100 } else { x }),
            None => None
        };

        Some(Player {
            health: 100,
            mana: mana,
            level: self.level,
        })
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        return match self.mana {
            Some(x) => {
                if x < mana_cost {
                    self.remove_from_health(mana_cost);
                } else {
                    self.mana = Some(x - mana_cost);
                }
                mana_cost * 2
            }
            None => {
                self.remove_from_health(mana_cost);
                0
            }
        };
    }

    fn remove_from_health(&mut self, mana_cost: u32) {
        let h = self.health;
        if h < mana_cost {
            self.health = 0
        } else {
            self.health -= mana_cost
        }
    }
}
