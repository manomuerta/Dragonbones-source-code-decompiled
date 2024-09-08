package _584
{
   import _11106._11108;
   import _11111._11110;
   import _1404._1407;
   import _24.Shortcut;
   import _24._26;
   import _472._13203;
   import _51._52;
   import _51._79;
   import _579._580;
   import _579._581;
   import _586._594;
   import _586._600;
   import _648._665;
   import _708._715;
   import _708._716;
   import _708._718;
   import _708._719;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._87;
   import _81._91;
   import _93._94;
   import flash.utils.Dictionary;
   
   public class _583 extends _94
   {
      private var _4981:Object;
      
      public var _2871:_665;
      
      public function _583()
      {
         this._4981 = {};
         super();
         this._4981[_26.SELECT] = _716.SELECT;
         this._4981[_26.CREATE_BONE] = _716.CREATE_BONE;
         this._4981[_26.POSE] = _716.POSE;
         this._4981[_26.WEIGHT] = _716.WEIGHT;
      }
      
      override protected function _1576() : void
      {
         Shortcut._1681(stage,_26.SELECT,this._4977);
         Shortcut._1681(stage,_26.CREATE_BONE,this._4977);
         Shortcut._1681(stage,_26.POSE,this._4977);
         Shortcut._1681(stage,_26.WEIGHT,this._4977);
         Shortcut._1681(stage,_26.MOVE_UP,this._4973);
         Shortcut._1681(stage,_26.MOVE_DOWN,this._4973);
         Shortcut._1681(stage,_26.MOVE_LEFT,this._4973);
         Shortcut._1681(stage,_26.MOVE_RIGHT,this._4973);
         Shortcut._1681(stage,_26.FAST_MOVE_UP,this._4973);
         Shortcut._1681(stage,_26.FAST_MOVE_DOWN,this._4973);
         Shortcut._1681(stage,_26.FAST_MOVE_LEFT,this._4973);
         Shortcut._1681(stage,_26.FAST_MOVE_RIGHT,this._4973);
         Shortcut._1681(stage,_26.SLOW_MOVE_UP,this._4973);
         Shortcut._1681(stage,_26.SLOW_MOVE_DOWN,this._4973);
         Shortcut._1681(stage,_26.SLOW_MOVE_LEFT,this._4973);
         Shortcut._1681(stage,_26.SLOW_MOVE_RIGHT,this._4973);
         Shortcut._1681(stage,_26.DESELECT,this._4974);
         Shortcut._1681(stage,_26.SHOW_BONES,this._11654);
         Shortcut._1681(stage,_26.SHOW_IMAGES,this._11653);
         Shortcut._1681(stage,_26.SETUP_ANI_MODE,this._4979);
         Shortcut._1681(stage,_26.STORE_GROUP_0,this._4972);
         Shortcut._1681(stage,_26.STORE_GROUP_1,this._4972);
         Shortcut._1681(stage,_26.STORE_GROUP_2,this._4972);
         Shortcut._1681(stage,_26.STORE_GROUP_3,this._4972);
         Shortcut._1681(stage,_26.STORE_GROUP_4,this._4972);
         Shortcut._1681(stage,_26.STORE_GROUP_5,this._4972);
         Shortcut._1681(stage,_26.STORE_GROUP_6,this._4972);
         Shortcut._1681(stage,_26.STORE_GROUP_7,this._4972);
         Shortcut._1681(stage,_26.STORE_GROUP_8,this._4972);
         Shortcut._1681(stage,_26.STORE_GROUP_9,this._4972);
         Shortcut._1681(stage,_26.SELECT_GROUP_0,this._4975);
         Shortcut._1681(stage,_26.SELECT_GROUP_1,this._4975);
         Shortcut._1681(stage,_26.SELECT_GROUP_2,this._4975);
         Shortcut._1681(stage,_26.SELECT_GROUP_3,this._4975);
         Shortcut._1681(stage,_26.SELECT_GROUP_4,this._4975);
         Shortcut._1681(stage,_26.SELECT_GROUP_5,this._4975);
         Shortcut._1681(stage,_26.SELECT_GROUP_6,this._4975);
         Shortcut._1681(stage,_26.SELECT_GROUP_7,this._4975);
         Shortcut._1681(stage,_26.SELECT_GROUP_8,this._4975);
         Shortcut._1681(stage,_26.SELECT_GROUP_9,this._4975);
      }
      
      private function _4974(param1:String) : void
      {
         _1567(new CommandNotification(StageNotification.CANCEL_SELECTION));
      }
      
      private function _4979(param1:String) : void
      {
         _11110.instance._11593(CommandNotification.STAGE_CHANGE,_11108.Shortcut);
         _1567(new CommandNotification(CommandNotification.STAGE_CHANGE));
      }
      
      private function _4975(param1:String) : void
      {
         this._13355._13348(param1);
      }
      
      private function _4972(param1:String) : void
      {
         this._13355._13345(param1);
      }
      
      private function _11654(param1:String) : void
      {
         _1567(new CommandNotification(CommandNotification.SHOW_OR_HIDE_ALL_BONES));
      }
      
      private function _11653(param1:String) : void
      {
         _1567(new CommandNotification(CommandNotification.SHOW_OR_HODE_ALL_IMAGES));
      }
      
      private function _4977(param1:String) : void
      {
         if(!this._2871)
         {
            return;
         }
         switch(param1)
         {
            case _26.SELECT:
               if(Boolean(this._3176) && this._3176._3332 != _716.SELECT)
               {
                  _1567(new CommandNotification(CommandNotification.CHANGE_TOOL,_716.SELECT));
               }
               break;
            case _26.CREATE_BONE:
               if(this._3176 && _2220._2873 == _715.ARMATURE && this._3176._3332 != _716.CREATE_BONE)
               {
                  _11110.instance._11380._11130(_11108.Shortcut);
                  _1567(new CommandNotification(CommandNotification.CHANGE_TOOL,_716.CREATE_BONE));
               }
               break;
            case _26.POSE:
               if(Boolean(this._3176) && this._3176._3332 != _716.POSE)
               {
                  _1567(new CommandNotification(CommandNotification.CHANGE_TOOL,_716.POSE));
               }
               break;
            case _26.WEIGHT:
               if(Boolean(this._3176) && this._3176._3332 != _716.WEIGHT)
               {
                  _1567(new CommandNotification(CommandNotification.CHANGE_TOOL,_716.WEIGHT));
               }
         }
      }
      
      private function _4973(param1:String) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:Dictionary = null;
         var _loc8_:_91 = null;
         if(this._3219._4823 == null || this._3176._2212 == null)
         {
            return;
         }
         this._4970(param1);
         if(!this._3219._4823._4980)
         {
            return;
         }
         var _loc2_:Number = 1;
         switch(param1)
         {
            case _26.MOVE_UP:
            case _26.MOVE_DOWN:
            case _26.MOVE_LEFT:
            case _26.MOVE_RIGHT:
               _loc2_ = 1;
               break;
            case _26.FAST_MOVE_UP:
            case _26.FAST_MOVE_DOWN:
            case _26.FAST_MOVE_LEFT:
            case _26.FAST_MOVE_RIGHT:
               _loc2_ = 10;
               break;
            case _26.SLOW_MOVE_UP:
            case _26.SLOW_MOVE_DOWN:
            case _26.SLOW_MOVE_LEFT:
            case _26.SLOW_MOVE_RIGHT:
               _loc2_ = 0.1;
         }
         _loc2_ = _loc2_ * int(100 / this._3176._2212._2580) / 100;
         var _loc3_:Object = _2226._2484;
         if(_loc3_ == null)
         {
            return;
         }
         if(this._3008._10534())
         {
            switch(param1)
            {
               case _26.MOVE_UP:
               case _26.FAST_MOVE_UP:
               case _26.SLOW_MOVE_UP:
                  this._3008._10533(0,-_loc2_);
                  break;
               case _26.MOVE_DOWN:
               case _26.FAST_MOVE_DOWN:
               case _26.SLOW_MOVE_DOWN:
                  this._3008._10533(0,_loc2_);
                  break;
               case _26.MOVE_LEFT:
               case _26.FAST_MOVE_LEFT:
               case _26.SLOW_MOVE_LEFT:
                  this._3008._10533(-_loc2_,0);
                  break;
               case _26.MOVE_RIGHT:
               case _26.FAST_MOVE_RIGHT:
               case _26.SLOW_MOVE_RIGHT:
                  this._3008._10533(_loc2_,0);
            }
            return;
         }
         var _loc4_:Array = [];
         for each(_loc5_ in _2226._2889)
         {
            if(_loc5_ is _52)
            {
               if(_52(_loc5_)._1980 && _52(_loc5_).parentBoneData && _52(_loc5_).parentBoneData._1980)
               {
                  if(_52(_loc5_).rootArmatureData._1955(_52(_loc5_),_52(_loc5_).parentBoneData))
                  {
                     continue;
                  }
               }
            }
            _loc4_.push(_loc5_);
         }
         _loc6_ = _87._2199(_loc4_,{
            "filterBone":1,
            "filterSlot":(_2214._2220._2873 == _715.ANIMATE ? 2 : 1),
            "convertSlotToBone":_2214._2220._2873 == _715.GENERAL
         });
         _loc7_ = new Dictionary();
         for each(_loc8_ in _loc4_)
         {
            _loc7_[_loc8_] = _loc8_.globalTransform.clone();
         }
         switch(param1)
         {
            case _26.MOVE_UP:
            case _26.FAST_MOVE_UP:
            case _26.SLOW_MOVE_UP:
               this._4850._4969(_loc7_,_loc6_,_loc4_,_719.GLOBAL,[_718.Y,-_loc2_,this.add]);
               break;
            case _26.MOVE_DOWN:
            case _26.FAST_MOVE_DOWN:
            case _26.SLOW_MOVE_DOWN:
               this._4850._4969(_loc7_,_loc6_,_loc4_,_719.GLOBAL,[_718.Y,_loc2_,this.add]);
               break;
            case _26.MOVE_LEFT:
            case _26.FAST_MOVE_LEFT:
            case _26.SLOW_MOVE_LEFT:
               this._4850._4969(_loc7_,_loc6_,_loc4_,_719.GLOBAL,[_718.X,-_loc2_,this.add]);
               break;
            case _26.MOVE_RIGHT:
            case _26.FAST_MOVE_RIGHT:
            case _26.SLOW_MOVE_RIGHT:
               this._4850._4969(_loc7_,_loc6_,_loc4_,_719.GLOBAL,[_718.X,_loc2_,this.add]);
         }
      }
      
      private function _4970(param1:String) : void
      {
         var _loc2_:* = false;
         if(param1 == _26.MOVE_RIGHT || _26.MOVE_LEFT == param1)
         {
            _loc2_ = _26.MOVE_RIGHT == param1;
            _1567(new CommandNotification(CommandNotification.SCENE_PANEL_TREE_SOLT_ITEMS,_loc2_));
         }
      }
      
      private function get _4763() : String
      {
         var _loc1_:Object = _2226._2484;
         if(_loc1_ is _52)
         {
            if(_2220._2873 == _715.ARMATURE)
            {
               return CommandNotification.MODIFY_BONE_TRANSFORM;
            }
            if(_2220._2873 == _715.ANIMATE)
            {
               return CommandNotification.MODIFY_BONE_FRAME_TRANSFORM;
            }
            if(_2220._2873 == _715.GENERAL)
            {
               return CommandNotification.MODIFY_BASIC_BONE_FRAME_TRANSFORM;
            }
         }
         else if(_loc1_ is _79)
         {
            if(_2220._2873 == _715.ARMATURE)
            {
               return CommandNotification.MODIFY_SLOT_TRANSFORM;
            }
            if(_2220._2873 == _715.GENERAL)
            {
               return CommandNotification.MODIFY_BASIC_BONE_FRAME_TRANSFORM;
            }
         }
         return "";
      }
      
      private function add(param1:Number, param2:Number) : Number
      {
         return param1 + param2;
      }
      
      private function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
      
      private function get _3219() : _581
      {
         return _1407.getInstance(_581) as _581;
      }
      
      private function get _4850() : _600
      {
         return _1407.getInstance(_600) as _600;
      }
      
      private function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
      
      public function get _13355() : _13203
      {
         return _1407.getInstance(_13203) as _13203;
      }
   }
}

