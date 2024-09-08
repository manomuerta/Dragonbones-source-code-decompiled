package _543
{
   import _11106._11105;
   import _11106._11108;
   import _11111._11110;
   import _1374.Alert;
   import _1404._1407;
   import _214._213;
   import _28._29;
   import _470._469;
   import _51._52;
   import _51._79;
   import _521._12460;
   import _521._532;
   import _541._540;
   import _555.LibraryPanelController;
   import _555._571;
   import _710._713;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _874._873;
   import _97._115;
   import _97._124;
   import egret.utils.tr;
   
   public class _545 extends _544
   {
      public function _545(param1:_873, param2:_540)
      {
         super(param1,param2);
      }
      
      override public function _3935(param1:_29) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:_52 = null;
         var _loc7_:_79 = null;
         var _loc8_:Object = null;
         _loc2_ = targets[0] as _52;
         if(param1 == null)
         {
            return;
         }
         switch(param1.id)
         {
            case _713.BONE:
               if(Boolean(_loc2_) && Boolean(_loc2_.rootArmatureData))
               {
                  _11110.instance._11318._11130(_11108.SceneTreeContextMenu);
                  _11110.instance._11318._11139(_11105.NewElement_ElementType,_11105.ElementType_Bone);
                  _11110.instance._11318._11132();
                  _loc6_ = _52._1729(_124._1747("bone",_loc2_.rootArmatureData._1793),_loc2_);
                  _loc3_ = _469._2916(_loc6_,_loc2_);
                  _1567(new CommandNotification(CommandNotification.ADD_BONE,_loc3_));
               }
               break;
            case _713.SLOT:
               if(Boolean(_loc2_) && Boolean(_loc2_.rootArmatureData))
               {
                  _11110.instance._11318._11130(_11108.SceneTreeContextMenu);
                  _11110.instance._11318._11139(_11105.NewElement_ElementType,_11105.ElementType_Slot);
                  _11110.instance._11318._11132();
                  _loc7_ = _79._1729(_124._1747(_loc2_.name,_loc2_.rootArmatureData._1996),_loc2_);
                  _loc3_ = _469._2897(_loc7_,_loc2_);
                  _1567(new CommandNotification(CommandNotification.ADD_SLOT,_loc3_));
               }
               break;
            case _713.BOUNDING_BOX:
            case _713.PASTE_BONE:
            case _713.SELECTIVE_PASTE:
               if(Boolean(_loc2_) && Boolean(_loc2_.rootArmatureData))
               {
                  _1567(new MenuNotification(param1.userData,null,_loc2_));
               }
               break;
            case _713.KEY_FRAME:
               _1567(new MenuNotification(param1.userData));
               break;
            case _713.DUPLICATE:
               _loc4_ = {"duplicateObj":_loc2_};
               if(Boolean(_loc2_) && Boolean(_loc2_.parentBoneData))
               {
                  this._1567(new MenuNotification(MenuNotification.DUPLICATE,null,"scenepanel"));
               }
               else if(_loc2_.name == "root")
               {
                  Alert.show(tr("Alert.RootNoDuplicate"));
               }
               break;
            case _713.COPY_BONE:
               if(Boolean(_loc2_) && Boolean(_loc2_.rootArmatureData))
               {
                  if(this._2861._3678)
                  {
                     (_loc8_ = {})._1836 = _loc2_;
                     _loc8_.libraryPath = this._2861._3678._3680();
                     _1567(new CommandNotification(CommandNotification.COPY_BONE,_loc8_));
                  }
               }
               break;
            case _713.COPY_TRANSFORM:
               _loc5_ = {"_1783":_loc2_};
               if(_loc2_)
               {
                  _1567(new CommandNotification(CommandNotification.COPY_TRANSFORM,_loc5_));
               }
               break;
            case _713.PASTE_TRANSFORM:
            case _713.SET_PARENT:
               _1567(new MenuNotification(param1.userData));
               break;
            case _713.EXPAND_ALL:
            case _713.COLLAPSE_ALL:
            case _713.EXPAND_SELECTED:
            case _713.COLLAPSE_SELECTED:
            case _713.RENAME:
            case _713.DELETE:
               _1567(new MenuNotification(param1.userData,null,"scenePanel"));
               break;
            case _713.HIDE:
               this._2880._3949(targets,false);
               break;
            case _713.HIDE_OTHERS:
               this._2880._3953(targets,false);
               break;
            case _713.HIDE_IRRELEVANT:
               this._2880._3947(targets,false);
               break;
            case _713.HIDE_RELATED:
               this._2880._14533(targets,false);
               break;
            case _713.LOCK:
               this._2880._3950([_loc2_],false);
               break;
            case _713.LOCK_OTHERS:
               this._2880._3952(targets,false);
               break;
            case _713.LOCK_IRRELEVANT:
               this._2880._3946(targets,false);
               break;
            case _713.LOCK_RELATED:
               this._2880._14532(targets,false);
               break;
            case _713.SHOW_ALL:
               this._2880.showAll();
         }
      }
      
      override protected function _3939() : void
      {
         super._3939();
         var _loc1_:_29 = _115._2364(_713.PASTE_TRANSFORM) as _29;
         if(_loc1_)
         {
            _loc1_.enabled = _213.type == _213.TYPE_TRANSFORM;
         }
         var _loc2_:_29 = _115._2364(_713.DELETE) as _29;
         var _loc3_:_29 = _115._2364(_713.SET_PARENT) as _29;
         if(_loc2_)
         {
            _loc2_.enabled = this._2880._3951;
         }
         if(_loc3_)
         {
            _loc3_.enabled = this._2880._3948;
         }
         var _loc4_:_29 = _115._2364(_713.INSERT) as _29;
         if(_loc4_)
         {
            _loc4_.enabled = _532.instance._2889.length == 1 && _532.instance._14529();
         }
         var _loc5_:_29 = _115._2364(_713.COPY_BONE) as _29;
         var _loc6_:_29 = _115._2364(_713.PASTE_BONE) as _29;
         var _loc7_:_29 = _115._2364(_713.DUPLICATE) as _29;
         var _loc8_:_29 = _115._2364(_713.SELECTIVE_PASTE) as _29;
         if(_loc5_)
         {
            _loc5_.enabled = this._12624._12602();
         }
         if(_loc6_)
         {
            _loc6_.enabled = this._12624._12598();
         }
         if(_loc7_)
         {
            _loc7_.enabled = this._12624._12602();
         }
         if(_loc8_)
         {
            _loc8_.enabled = this._12624._14499();
         }
      }
      
      private function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      private function get _12624() : _12460
      {
         return _1407.getInstance(_12460) as _12460;
      }
   }
}

