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
   
   public class _550 extends _544
   {
      public function _550(param1:_873, param2:_540)
      {
         super(param1,param2);
      }
      
      override public function _3935(param1:_29) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:Object = null;
         _loc2_ = targets[0] as _79;
         if(targets[0] is _79 && (targets[0] as _79)._2164)
         {
            _loc2_ = targets[0] as _79;
         }
         if(param1.parent)
         {
            if(param1.parent.id == _713.SWITCH_DISPLAY)
            {
               this._2880.switchDisplay(!!param1.userData ? param1.userData : (targets[0] as _79)._2049);
               return;
            }
         }
         switch(param1.id)
         {
            case _713.SET_PARENT:
            case _713.DISTRIBUTE_SLOT_TO_FRAMES:
               _1567(new MenuNotification(param1.userData));
               break;
            case _713.EXPAND_ALL:
            case _713.COLLAPSE_ALL:
            case _713.EXPAND_SELECTED:
            case _713.COLLAPSE_SELECTED:
            case _713.RENAME:
            case _713.DELETE:
            case _713.SWAP_IMAGE:
            case _713.COPY_SLOT:
            case _713.PASTE_SLOT:
            case _713.COPY_DISPLAY:
            case _713.PASTE_DISPLAY:
            case _713.COPY_SLOT_PROPERTY:
            case _713.PASTE_SLOT_PROPERTY:
            case _713.SELECTIVE_PASTE:
            case _713.BRING_TO_FRONT:
            case _713.BRING_FORWARD:
            case _713.SEND_BACKWARD:
            case _713.SEND_TO_BOTTOM:
               _1567(new MenuNotification(param1.userData,null,"scenePanel"));
               break;
            case _713.DUPLICATE:
               if(_loc2_)
               {
                  this._1567(new MenuNotification(MenuNotification.DUPLICATE,null,"scenepanel"));
               }
               break;
            case _713.COPY_TRANSFORM:
               _loc3_ = {"_1783":_loc2_};
               if(_loc2_)
               {
                  _1567(new CommandNotification(CommandNotification.COPY_TRANSFORM,_loc3_));
               }
               break;
            case _713.SET_PARENT:
            case _713.PASTE_TRANSFORM:
               _1567(new MenuNotification(param1.userData));
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
      
      override protected function _3941(param1:Array) : void
      {
         var _loc3_:_79 = null;
         var _loc4_:Array = null;
         var _loc5_:_70 = null;
         var _loc6_:Object = null;
         var _loc2_:int = int(param1.indexOf(_713.SWITCH_DISPLAY));
         if(_loc2_ != -1)
         {
            if(targets[0] is _79 && (targets[0] as _79)._2164)
            {
               _loc3_ = targets[0] as _79;
               _loc4_ = [];
               for each(_loc6_ in _loc3_._1715)
               {
                  _loc5_ = _loc3_._1765[_loc6_] as _70;
                  _loc4_.push(_27._1697(_loc5_.name,_loc5_.name,null,null,"check",_loc5_));
               }
               _loc4_.push(_713.NULL);
               param1.splice(_loc2_,1,[param1[_loc2_],_loc4_]);
            }
            else
            {
               param1.splice(_loc2_,1);
            }
         }
      }
      
      override protected function _3939() : void
      {
         super._3939();
         var _loc1_:_29 = _115._2364(_713.DELETE) as _29;
         var _loc2_:_29 = _115._2364(_713.SET_PARENT) as _29;
         var _loc3_:_29 = _115._2364(_713.DISTRIBUTE_SLOT_TO_FRAMES) as _29;
         if(_loc1_)
         {
            _loc1_.enabled = this._2880._3951;
         }
         if(_loc2_)
         {
            _loc2_.enabled = this._2880._3948;
         }
         var _loc4_:_29 = _115._2364(_713.PASTE_TRANSFORM) as _29;
         if(_loc4_)
         {
            _loc4_.enabled = _213.type == _213.TYPE_TRANSFORM;
         }
         var _loc5_:_29 = _115._2364(_713.SWAP_IMAGE) as _29;
         if(_loc5_)
         {
            _loc5_.enabled = this._2880._10503;
         }
         if(_loc3_)
         {
            _loc3_.enabled = this._2880._11146;
         }
         var _loc6_:_29 = _115._2364(_713.COPY_SLOT) as _29;
         var _loc7_:_29 = _115._2364(_713.PASTE_DISPLAY) as _29;
         var _loc8_:_29 = _115._2364(_713.COPY_DISPLAY) as _29;
         var _loc9_:_29 = _115._2364(_713.COPY_SLOT_PROPERTY) as _29;
         var _loc10_:_29 = _115._2364(_713.PASTE_SLOT_PROPERTY) as _29;
         var _loc11_:_29 = _115._2364(_713.SELECTIVE_PASTE) as _29;
         if(_loc6_)
         {
            _loc6_.enabled = this._12624._12601();
         }
         if(_loc8_)
         {
            _loc8_.enabled = this._12624._12596();
         }
         if(_loc7_)
         {
            _loc7_.enabled = this._12624._12597();
         }
         if(_loc9_)
         {
            _loc9_.enabled = this._12624._12601();
         }
         if(_loc10_)
         {
            _loc10_.enabled = this._12624._14503();
         }
         if(_loc11_)
         {
            _loc11_.enabled = this._12624._14498();
         }
         var _loc12_:_29 = _115._2364(_713.BRING_TO_FRONT) as _29;
         var _loc13_:_29 = _115._2364(_713.BRING_FORWARD) as _29;
         var _loc14_:_29 = _115._2364(_713.SEND_BACKWARD) as _29;
         var _loc15_:_29 = _115._2364(_713.SEND_TO_BOTTOM) as _29;
         var _loc16_:Array = this._2908._3954();
         if(_loc13_)
         {
            _loc12_.enabled = _loc16_[0];
            _loc13_.enabled = _loc16_[0];
         }
         if(_loc14_)
         {
            _loc15_.enabled = _loc16_[1];
            _loc14_.enabled = _loc16_[1];
         }
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

