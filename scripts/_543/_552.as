package _543
{
   import _1404._1407;
   import _28._29;
   import _35.HashObject;
   import _51._52;
   import _541._540;
   import _555._571;
   import _573.TimelinePanelController;
   import _710._713;
   import _783.MenuNotification;
   import _874._873;
   import _97._115;
   
   public class _552 extends _544
   {
      public function _552(param1:_873, param2:_540)
      {
         super(param1,param2);
      }
      
      override public function _3935(param1:_29) : void
      {
         var _loc2_:HashObject = null;
         switch(param1.id)
         {
            case _713.HIDE_OTHERS:
               if(targets.length > 0)
               {
                  _loc2_ = targets[0];
                  if(_loc2_)
                  {
                     if(_loc2_ is _52)
                     {
                        this._2880._3953(targets,false);
                     }
                     else
                     {
                        this._2880._3947(targets,false);
                     }
                  }
               }
               break;
            case _713.LOCK_OTHERS:
               if(targets.length > 0)
               {
                  _loc2_ = targets[0];
                  if(_loc2_)
                  {
                     if(_loc2_ is _52)
                     {
                        this._2880._3952(targets,false);
                     }
                     else
                     {
                        this._2880._3946(targets,false);
                     }
                  }
               }
               break;
            case _713.HIDE_OTHERS_LAYER:
               if(targets.length > 0)
               {
                  _loc2_ = targets[0];
                  if(_loc2_)
                  {
                     this._2880._3964(_loc2_,false);
                  }
               }
               break;
            case _713.LOCK_OTHERS_LAYER:
               if(targets.length > 0)
               {
                  _loc2_ = targets[0];
                  if(_loc2_)
                  {
                     this._2880._3963(_loc2_,false);
                  }
               }
               break;
            case _713.SHOW_ALL:
               this._2880.showAll();
               break;
            case _713.EXPAND_ALL:
            case _713.COLLAPSE_ALL:
            case _713.RENAME:
            case _713.ADD_TWEEN:
            case _713.DELETE_TWEEN:
               this._1567(new MenuNotification(param1.userData,param1.id.toString(),"timeline"));
               break;
            default:
               this._1567(new MenuNotification(param1.userData));
         }
      }
      
      override protected function _3941(param1:Array) : void
      {
         var _loc2_:int = int(param1.indexOf(_713.ADD_TWEEN));
         var _loc3_:int = int(param1.indexOf(_713.DELETE_TWEEN));
         var _loc4_:Boolean = this._2852._3962;
         var _loc5_:Boolean = this._2852._3959;
         if(!_loc5_)
         {
            if(_loc3_ != -1)
            {
               param1.splice(_loc3_,1);
            }
         }
         if(!_loc4_)
         {
            if(_loc2_ != -1)
            {
               param1.splice(_loc2_,1);
            }
         }
         var _loc6_:int = int(param1.indexOf(_713.KEY_FRAME));
         var _loc7_:Boolean = this._2852._13778;
         if(_loc6_ >= 0 && !_loc7_)
         {
            param1.splice(_loc6_,1);
         }
      }
      
      override protected function _3939() : void
      {
         var _loc1_:Object = null;
         if(Boolean(targets) && targets.length > 0)
         {
            _loc1_ = targets[0];
         }
         var _loc2_:_29 = _115._2364(_713.ADD_TWEEN) as _29;
         var _loc3_:_29 = _115._2364(_713.DELETE_TWEEN) as _29;
         var _loc4_:_29 = _115._2364(_713.KEY_FRAME) as _29;
         var _loc5_:_29 = _115._2364(_713.CUT_FRAME) as _29;
         var _loc6_:_29 = _115._2364(_713.COPY_FRAME) as _29;
         var _loc7_:_29 = _115._2364(_713.PASTE_FRAME) as _29;
         var _loc8_:_29 = _115._2364(_713.DELETE_FRAME) as _29;
         var _loc9_:_29 = _115._2364(_713.EXPAND_ALL) as _29;
         var _loc10_:_29 = _115._2364(_713.COLLAPSE_ALL) as _29;
         var _loc11_:_29 = _115._2364(_713.DELETE_LAYER) as _29;
         if(_loc4_)
         {
            _loc4_.enabled = this._2852._3960;
         }
         if(_loc5_)
         {
            _loc5_.enabled = this._2852._3965;
         }
         if(_loc6_)
         {
            _loc6_.enabled = this._2852._3965;
         }
         if(_loc7_)
         {
            _loc7_.enabled = this._2852._3961;
         }
         if(_loc8_)
         {
            _loc8_.enabled = this._2852._3965;
         }
         if(_loc11_)
         {
            _loc11_.enabled = this._2852._3958();
         }
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      private function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
   }
}

