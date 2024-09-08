package _543
{
   import _1404._1407;
   import _214._213;
   import _28._27;
   import _28._29;
   import _51._70;
   import _51._79;
   import _521._12460;
   import _541._540;
   import _555._558;
   import _555._571;
   import _710._713;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _874._873;
   import _97._115;
   
   public class _547 extends _544
   {
      public function _547(param1:_873, param2:_540)
      {
         super(param1,param2);
      }
      
      override public function _3935(param1:_29) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:* = undefined;
         var _loc4_:Object = null;
         if(targets[0] is _79 && (targets[0] as _79)._2164)
         {
            _loc2_ = targets[0] as _79;
         }
         if(param1.parent)
         {
            if(param1.parent.id == _713.SWITCH_DISPLAY)
            {
               this._2880.switchDisplay(!!param1.userData ? param1.userData : (targets[0] as _79)._2049);
            }
         }
         else
         {
            switch(param1.id)
            {
               case _713.DISTRIBUTE_TO_FRAMES:
               case _713.DISTRIBUTE_SLOT_TO_FRAMES:
               case _713.KEY_FRAME:
               case _713.DELETE:
               case _713.DELETE_SLOT:
               case _713.CONVERT_TO_MESH:
               case _713.CONVERT_TO_IMAGE:
               case _713.SET_PARENT:
               case _713.BRING_TO_FRONT:
               case _713.BRING_FORWARD:
               case _713.SEND_BACKWARD:
               case _713.SEND_TO_BOTTOM:
               case _713.SWAP_IMAGE:
               case _713.COPY_SLOT:
               case _713.PASTE_SLOT:
               case _713.COPY_DISPLAY:
               case _713.PASTE_DISPLAY:
               case _713.COPY_SLOT_PROPERTY:
               case _713.PASTE_SLOT_PROPERTY:
               case _713.SHOW_ITEM:
                  this._1567(new MenuNotification(param1.userData));
                  break;
               case _713.RENAME:
                  _1567(new MenuNotification(param1.userData,null,"scenePanel"));
                  break;
               case _713.MESH:
                  if(targets[0] is _79 && (targets[0] as _79)._2164)
                  {
                     _loc3_ = targets[0] as _79;
                  }
                  else if(targets[0] is _70)
                  {
                     _loc3_ = targets[0] as _70;
                  }
                  if(_loc3_)
                  {
                     if(_loc3_._2165)
                     {
                        this._1567(new MenuNotification(MenuNotification.CONVERT_TO_IMAGE));
                     }
                     else
                     {
                        this._1567(new MenuNotification(MenuNotification.CONVERT_TO_MESH));
                     }
                  }
                  break;
               case _713.DUPLICATE:
                  if(_loc2_)
                  {
                     this._1567(new MenuNotification(MenuNotification.DUPLICATE,null,"scenepanel"));
                  }
                  break;
               case _713.COPY_TRANSFORM:
                  _loc4_ = {"_1783":_loc2_};
                  if(_loc2_)
                  {
                     _1567(new CommandNotification(CommandNotification.COPY_TRANSFORM,_loc4_));
                  }
                  break;
               case _713.PASTE_TRANSFORM:
                  _1567(new MenuNotification(param1.userData));
                  break;
               case _713.EXPAND_ALL:
               case _713.COLLAPSE_ALL:
                  _1567(new MenuNotification(param1.userData,null,"scenePanel"));
                  break;
               case _713.HIDE:
                  this._2880._3949([_loc2_],false,true);
                  break;
               case _713.HIDE_OTHERS:
                  this._2880._3947(targets,false);
                  break;
               case _713.LOCK:
                  this._2880._3950([_loc2_],false);
                  break;
               case _713.LOCK_OTHERS:
                  this._2880._3946(targets,false);
                  break;
               case _713.SHOW_ALL:
                  this._2880.showAll();
            }
         }
      }
      
      override protected function _3941(param1:Array) : void
      {
         var _loc11_:_79 = null;
         var _loc12_:Array = null;
         var _loc13_:_70 = null;
         var _loc14_:Object = null;
         var _loc2_:int = int(param1.indexOf(_713.SWITCH_DISPLAY));
         if(_loc2_ != -1)
         {
            if(targets[0] is _79 && (targets[0] as _79)._2164)
            {
               _loc11_ = targets[0] as _79;
               _loc12_ = [];
               for each(_loc14_ in _loc11_._1715)
               {
                  _loc13_ = _loc11_._1765[_loc14_] as _70;
                  _loc12_.push(_27._1697(_loc13_.name,_loc13_.name,null,null,"check",_loc13_));
               }
               _loc12_.push(_713.NULL);
               param1.splice(_loc2_,1,[param1[_loc2_],_loc12_]);
            }
            else
            {
               param1.splice(_loc2_,1);
            }
         }
         _loc2_ = int(param1.indexOf(_713.CONVERT_TO_IMAGE));
         if(_loc2_ != -1)
         {
            if(_3942)
            {
               param1.splice(_loc2_,1);
            }
         }
         _loc2_ = int(param1.indexOf(_713.CONVERT_TO_MESH));
         if(_loc2_ != -1)
         {
            if(_3942)
            {
               param1.splice(_loc2_,1);
            }
         }
         _loc2_ = int(param1.indexOf(_713.MESH));
         if(_loc2_ != -1)
         {
            if(_3942)
            {
               param1.splice(_loc2_,1);
            }
         }
         _loc2_ = int(param1.indexOf(_713.SHOW_ITEM));
         if(_loc2_ != -1 && _3942)
         {
            param1.splice(_loc2_,1);
         }
         _loc2_ = int(param1.indexOf(_713.EDIT));
         if(_loc2_ != -1)
         {
            param1.splice(_loc2_,1);
         }
         var _loc3_:_29 = _115._2364(_713.COPY_SLOT) as _29;
         var _loc4_:_29 = _115._2364(_713.PASTE_DISPLAY) as _29;
         var _loc5_:_29 = _115._2364(_713.COPY_DISPLAY) as _29;
         var _loc6_:_29 = _115._2364(_713.COPY_SLOT_PROPERTY) as _29;
         var _loc7_:_29 = _115._2364(_713.PASTE_SLOT_PROPERTY) as _29;
         var _loc8_:_29 = _115._2364(_713.SELECTIVE_PASTE) as _29;
         var _loc9_:_29 = _115._2364(_713.MESH) as _29;
         if(_loc9_)
         {
            _loc9_.type = "check";
         }
         var _loc10_:_29 = _115._2364(_713.SHOW_ITEM) as _29;
         if(_loc10_)
         {
            _loc10_.type = "check";
         }
         if(_loc3_)
         {
            _loc3_.enabled = this._12624._12601();
         }
         if(_loc5_)
         {
            _loc5_.enabled = this._12624._12596();
         }
         if(_loc4_)
         {
            _loc4_.enabled = this._12624._12597();
         }
         if(_loc6_)
         {
            _loc6_.enabled = this._12624._12601();
         }
         if(_loc7_)
         {
            _loc7_.enabled = this._12624._14503();
         }
         if(_loc8_)
         {
            _loc8_.enabled = this._12624._14498();
         }
      }
      
      override protected function _3939() : void
      {
         var _loc13_:_79 = null;
         var _loc14_:_29 = null;
         var _loc15_:_70 = null;
         super._3939();
         var _loc1_:_29 = _115._2364(_713.SWITCH_DISPLAY) as _29;
         _loc1_.enabled = !_3942;
         if(_loc1_.enabled)
         {
            if(targets[0] is _79)
            {
               _loc13_ = targets[0];
               for each(_loc14_ in _loc1_._1701)
               {
                  if(_loc14_.label == _loc13_._2049.name)
                  {
                     _loc14_._1705 = true;
                     break;
                  }
               }
            }
         }
         var _loc2_:_29 = _115._2364(_713.MESH) as _29;
         if(_loc2_)
         {
            if(targets[0] is _79)
            {
               _loc13_ = targets[0];
               _loc2_._1705 = _loc13_._2165 ? true : false;
            }
            else if(targets[0] is _70)
            {
               _loc15_ = targets[0];
               _loc2_._1705 = _loc15_._2165;
            }
         }
         var _loc3_:_29 = _115._2364(_713.SHOW_ITEM) as _29;
         if(_loc3_)
         {
            if(targets[0] is _70)
            {
               _loc15_ = targets[0];
               _loc3_._1705 = _loc15_._2100;
            }
         }
         var _loc4_:_29;
         (_loc4_ = _115._2364(_713.DISTRIBUTE_TO_FRAMES) as _29).enabled = this._3955;
         var _loc5_:_29;
         (_loc5_ = _115._2364(_713.DISTRIBUTE_SLOT_TO_FRAMES) as _29).enabled = this._11145;
         var _loc6_:_29 = _115._2364(_713.PASTE_TRANSFORM) as _29;
         if(_loc6_)
         {
            _loc6_.enabled = _213.type == _213.TYPE_TRANSFORM;
         }
         var _loc7_:_29 = _115._2364(_713.BRING_TO_FRONT) as _29;
         var _loc8_:_29 = _115._2364(_713.BRING_FORWARD) as _29;
         var _loc9_:_29 = _115._2364(_713.SEND_BACKWARD) as _29;
         var _loc10_:_29 = _115._2364(_713.SEND_TO_BOTTOM) as _29;
         var _loc11_:Array = this._2908._3954();
         if(_loc8_)
         {
            _loc7_.enabled = _loc11_[0];
            _loc8_.enabled = _loc11_[0];
         }
         if(_loc9_)
         {
            _loc10_.enabled = _loc11_[1];
            _loc9_.enabled = _loc11_[1];
         }
         var _loc12_:_29 = _115._2364(_713.SWAP_IMAGE) as _29;
         if(_loc12_)
         {
            _loc12_.enabled = this._2880._10503;
         }
      }
      
      private function get _3955() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(targets.length);
         while(_loc2_ < _loc3_)
         {
            if(!(targets[_loc2_] is _79 && (targets[_loc2_] as _79)._2049 != null))
            {
               return false;
            }
            _loc1_++;
            _loc2_++;
         }
         return _loc1_ > 1;
      }
      
      private function get _11145() : Boolean
      {
         if(targets.length == 1 && targets[0] is _79 && (targets[0] as _79)._1715.length > 1)
         {
            return true;
         }
         return false;
      }
      
      private function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
      
      private function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      private function get _12624() : _12460
      {
         return _1407.getInstance(_12460) as _12460;
      }
   }
}

