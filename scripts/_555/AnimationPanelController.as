package _555
{
   import _1045._1105;
   import _11111._11110;
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _1177.UIEvent;
   import _120._121;
   import _120._123;
   import _12465._12464;
   import _127._163;
   import _13492._13495;
   import _13503._13502;
   import _13505._13504;
   import _13505._13506;
   import _13505._13507;
   import _13505._13508;
   import _13505._13509;
   import _13545._13544;
   import _13545._13546;
   import _1374.Alert;
   import _1404._1407;
   import _172._174;
   import _217._11844;
   import _217._216;
   import _217._221;
   import _217._223;
   import _217._224;
   import _35._13488;
   import _40._10599;
   import _40._39;
   import _40._41;
   import _40._43;
   import _40._48;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._71;
   import _51._79;
   import _541._540;
   import _573.TimelinePanelController;
   import _648._650;
   import _648._665;
   import _668._667;
   import _676._675;
   import _703._702;
   import _703._705;
   import _708._714;
   import _708._715;
   import _710._711;
   import _710._712;
   import _73.SymbolType;
   import _73._74;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _783._12475;
   import _785.AnimationPanel;
   import _93._94;
   import _978.Timeline;
   import egret.core._1142;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.ui.Keyboard;
   
   public class AnimationPanelController extends _94
   {
      private var _3979:_667;
      
      private var animationPanel:AnimationPanel;
      
      private var _3974:_13544;
      
      private var _4018:Boolean;
      
      private var _3992:int;
      
      public function AnimationPanelController()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._3979 = new _667();
         this.animationPanel = _1407.getInstance(AnimationPanel);
      }
      
      override protected function _1576() : void
      {
         this.tree.addEventListener(IndexChangeEvent.CHANGE,this._3552);
         _1565(TimelineNotification.UPDATE_ANIMATION_DURATION,this._3977);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         _1565(_12475.CHECK_FUNCTION_LIMITED,this._13174);
         _1565(TimelineNotification.SELECT_ANIMATION,this._13783);
         if(this.animationPanel.initialized)
         {
            this._3990();
         }
         else
         {
            this.animationPanel.addEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         }
         _1565(MenuNotification.RENAME,this._4006);
         _1565(MenuNotification.CLONE_ANIMATION,this._4012);
         _1565(MenuNotification.ADD_ANIMATION,this._4017);
         _1565(MenuNotification.DELETE_ANIMATION,this._4007);
         this.animationPanel.addEventListener(KeyboardEvent.KEY_UP,this._4517,false);
         this.animationPanel.addEventListener(IndexChangeEvent.CHANGE,this._13782);
      }
      
      private function _13782(param1:IndexChangeEvent) : void
      {
         this._3552(param1);
      }
      
      private function _4517(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER && param1.currentTarget is AnimationPanel && param1.target is AnimationPanel)
         {
            this.animationPanel._13786._4516();
            this.animationPanel._13786._3514();
         }
      }
      
      private function _13783(param1:TimelineNotification) : void
      {
         var _loc2_:_13502 = param1.data as _13502;
         if(_loc2_)
         {
            this._2854(_loc2_);
         }
      }
      
      private function _13174(param1:_12475) : void
      {
         this._13175();
      }
      
      private function _13175() : void
      {
         if(Boolean(this.animationPanel) && Boolean(this.animationPanel._11611))
         {
            if(this._12950._12951())
            {
               this.animationPanel._11611.limited = true;
               this.animationPanel._11611.toolTip = tr("Pay.fun.limit");
            }
            else
            {
               this.animationPanel._11611.limited = false;
               this.animationPanel._11611.toolTip = tr("Animation.export.tooltip");
            }
         }
      }
      
      private function _4007(param1:MenuNotification) : void
      {
         this.onDel(null);
      }
      
      private function _4017(param1:MenuNotification) : void
      {
         this._4022(null);
      }
      
      private function _4012(param1:MenuNotification) : void
      {
         this._4014(null);
      }
      
      private function _4006(param1:MenuNotification) : void
      {
         if(param1.data == "animationPanel")
         {
            this._3984(null);
         }
      }
      
      private function _3973(param1:StageNotification) : void
      {
         this._3979._3994();
         this._3981();
      }
      
      private function _3976(param1:StageNotification) : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            this._4018 = true;
            if(this.animationPanel.initialized)
            {
               this._3989();
            }
         }
         else
         {
            this._4018 = false;
            if(this.animationPanel.initialized)
            {
               this._3989();
            }
         }
      }
      
      private function _3864(param1:StageNotification) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:_39 = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL)
         {
            _loc4_ = this._3979._3993();
            if(this._3974)
            {
               _loc5_ = 0;
               _loc6_ = int(_loc4_.length);
               while(_loc5_ < _loc6_)
               {
                  if(this._3974._1992 == _loc4_[_loc5_])
                  {
                     this.tree._2484 = this._3974;
                     _loc2_ = true;
                     break;
                  }
                  _loc5_++;
               }
            }
            if(!_loc2_)
            {
               this._3981();
               _1567(new TimelineNotification(TimelineNotification.UPDATE_ANIMATION_DURATION));
            }
         }
         else if(this._3974)
         {
            this._3974._1992._1868();
         }
      }
      
      private function _3981() : void
      {
         var _loc2_:_13502 = null;
         var _loc3_:_13544 = null;
         var _loc4_:_50 = null;
         var _loc5_:String = null;
         var _loc6_:_13544 = null;
         var _loc7_:_216 = null;
         var _loc1_:Array = this._3979._3993();
         if(_loc1_.length > 0)
         {
            if(this._3992 > 0)
            {
               if(_loc1_.length > this._3992)
               {
                  _loc2_ = _loc1_[this._3992] as _13502;
               }
               else
               {
                  _loc2_ = _loc1_[_loc1_.length - 1] as _13502;
               }
            }
            else
            {
               _loc2_ = _loc1_[0] as _13502;
            }
         }
         else
         {
            _loc3_ = this._3979._3997.source as _13544;
            _loc4_ = this._3979._2871._2865;
            _loc5_ = this.getAnimationName(tr("Animation.new.name"),"_");
            _loc6_ = this._3982(_loc4_,_loc3_,_loc5_);
            if(_loc6_)
            {
               _loc7_ = new _216();
               _loc7_._1572({
                  "armature":_loc4_,
                  "animation":[null,_loc6_._1992]
               });
               _loc7_.execute();
               _loc2_ = _loc6_._1992;
            }
            else
            {
               _loc2_ = null;
            }
         }
         if(_loc2_)
         {
            _1567(new TimelineNotification(TimelineNotification.SELECT_ANIMATION,_loc2_));
         }
      }
      
      private function _3978(param1:_50, param2:String, param3:int = 24) : _39
      {
         var _loc5_:_52 = null;
         var _loc8_:_79 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:_70 = null;
         var _loc4_:_39;
         (_loc4_ = new _39()).currentPosition = 0;
         _loc4_._1870 = 0;
         _loc4_.frameRate = param3;
         _loc4_.fadeInTime = 0;
         _loc4_.playTimes = 0;
         _loc4_.name = param2;
         _loc4_.frameRate = param3;
         _loc4_._1746 = [];
         _loc4_._1745 = [];
         _loc4_._1753 = [];
         _loc4_._10657 = _10599._1869(param1);
         var _loc6_:int = 0;
         var _loc7_:int = int(param1._1779.length);
         while(_loc6_ < _loc7_)
         {
            _loc5_ = param1._1779[_loc6_] as _52;
            _loc4_._1746.push(_41._1869(_loc5_));
            _loc6_++;
         }
         _loc6_ = 0;
         _loc7_ = int(param1._1780.length);
         while(_loc6_ < _loc7_)
         {
            _loc8_ = param1._1780[_loc6_] as _79;
            _loc4_._1745.push(_48._1869(_loc8_));
            _loc9_ = 0;
            _loc9_ = 0;
            _loc10_ = int(_loc8_._1715.length);
            while(_loc9_ < _loc10_)
            {
               _loc11_ = _loc8_._1765[_loc8_._1715[_loc9_]] as _70;
               if((Boolean(_loc11_)) && _loc11_.type == _74.MESH)
               {
                  _loc4_._1753.push(_43._1869(_loc11_));
               }
               _loc9_++;
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      private function _13781(param1:_50, param2:String, param3:int = 24) : _13502
      {
         var _loc4_:_13502;
         (_loc4_ = new _13502()).rootArmatureData = param1;
         _loc4_.currentPosition = 0;
         _loc4_._1870 = 0;
         _loc4_.frameRate = param3;
         _loc4_.fadeInTime = 0;
         _loc4_.playTimes = 0;
         _loc4_.name = param2;
         _loc4_.frameRate = param3;
         _loc4_._1746 = [];
         _loc4_._1745 = [];
         _loc4_._1753 = [];
         _loc4_._10657 = _13509._1869(param1,null,_loc4_);
         _loc4_._13597 = _13506._1869(param1,null,_loc4_);
         _loc4_._1871();
         return _loc4_;
      }
      
      public function _3982(param1:_50, param2:_13544, param3:String, param4:int = 24) : _13544
      {
         var _loc5_:_13544 = null;
         var _loc6_:_13502 = this._13781(param1,param3,param4);
         var _loc7_:SymbolType = _2214._1844._2871._2865._1811;
         if(_loc7_ == SymbolType.ARMATURE)
         {
            _loc5_ = _13544._3996(param2,_loc6_);
         }
         else if(_loc7_ == SymbolType.MC || _loc7_ == SymbolType.STAGE)
         {
            _loc5_ = _13546._3996(param2,_loc6_);
         }
         return _loc5_;
      }
      
      public function _11600(param1:_50, param2:_13544, param3:_13502) : _13544
      {
         var _loc4_:_13544 = null;
         var _loc5_:SymbolType = _2214._1844._2871._2865._1811;
         if(_loc5_ == SymbolType.ARMATURE)
         {
            _loc4_ = _13544._3996(param2,param3);
         }
         else if(_loc5_ == SymbolType.MC || _loc5_ == SymbolType.STAGE)
         {
            _loc4_ = _13546._3996(param2,param3);
         }
         return _loc4_;
      }
      
      private function _3977(param1:TimelineNotification) : void
      {
         this.updateAnimationInfo();
      }
      
      private function _3991(param1:UIEvent) : void
      {
         this.animationPanel.removeEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         this._3990();
      }
      
      private function _3990() : void
      {
         this.animationPanel._4020.addEventListener(MouseEvent.CLICK,this._4022);
         this.animationPanel._4008.addEventListener(MouseEvent.CLICK,this._4014);
         this.animationPanel.renameBtn.addEventListener(MouseEvent.CLICK,this._3984);
         this.animationPanel._4019.addEventListener(MouseEvent.CLICK,this.onDel);
         this.animationPanel.tree.doubleClickEnabled = true;
         this.animationPanel.tree.addEventListener(MouseEvent.DOUBLE_CLICK,this._4004);
         this.animationPanel.tree.addEventListener(ListEvent.ITEM_RIGHT_MOUSE_DOWN,this._4013);
         this.animationPanel._4010.addEventListener(FocusEvent.FOCUS_OUT,this._3999);
         this.animationPanel._4009.addEventListener(FocusEvent.FOCUS_OUT,this._4005);
         this.animationPanel._11607.addEventListener(MouseEvent.CLICK,this._11609);
         this.animationPanel._6366.addEventListener(MouseEvent.CLICK,this.onImportAnimation);
         this.animationPanel._11611.addEventListener(MouseEvent.CLICK,this._11579);
         this._13175();
      }
      
      private function _11579(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(Boolean(this._3974) && Boolean(this._3974._1992))
         {
            _loc2_ = this._3974._1992.name;
            _1567(new StageNotification(StageNotification.EXPORT_ANIMATION,_loc2_));
         }
      }
      
      private function onImportAnimation(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         try
         {
            FileUtil.browseForOpen(function(param1:Array):void
            {
               var _loc2_:File = null;
               var _loc3_:Object = null;
               var _loc4_:Vector.<_13502> = null;
               var _loc5_:Vector.<_13502> = null;
               var _loc6_:Vector.<_13502> = null;
               var _loc7_:int = 0;
               var _loc8_:int = 0;
               var _loc9_:String = null;
               var _loc10_:Object = null;
               if(!param1)
               {
                  return;
               }
               _loc3_ = {};
               _loc4_ = new Vector.<_13502>();
               _loc5_ = new Vector.<_13502>();
               _loc6_ = new Vector.<_13502>();
               _loc7_ = 0;
               _loc8_ = int(param1.length);
               while(_loc7_ < _loc8_)
               {
                  _loc2_ = param1[_loc7_];
                  if(Boolean(_loc2_) && _loc2_.extension == _650.ANIMATION_EXT)
                  {
                     _loc9_ = FileUtil.openAsString(_loc2_.nativePath);
                     _loc10_ = JSON.parse(_loc9_);
                     _11610(_loc10_,_loc3_,_loc4_,_loc5_,_loc6_);
                  }
                  _loc7_++;
               }
               _11971(_loc4_,_loc5_,_loc6_);
            },2,_650._11605,tr("Import.animation"));
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("AnimationPanelController::onImportAnimation",e);
            Alert.show(tr("Import.animation.fail"));
         }
      }
      
      private function _11610(param1:Object, param2:Object, param3:Vector.<_13502>, param4:Vector.<_13502>, param5:Vector.<_13502>) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc13_:_13502 = null;
         var _loc14_:_13502 = null;
         var _loc6_:_71 = _13488.parser(param1,false);
         var _loc7_:_50 = this._3979._2871._2865;
         var _loc10_:_50 = _loc6_._2107(_loc7_.name);
         var _loc11_:Vector.<_13502> = new Vector.<_13502>();
         var _loc12_:Vector.<_13502> = new Vector.<_13502>();
         if(_loc10_)
         {
            _loc8_ = 0;
            _loc9_ = int(_loc10_._13619.length);
            while(_loc8_ < _loc9_)
            {
               _loc13_ = _loc10_._13619[_loc8_] as _13502;
               if(_loc13_)
               {
                  if(_loc7_._1971(_loc13_.name))
                  {
                     _loc12_.push(_loc13_);
                  }
                  else if(param2[_loc13_.name] == null)
                  {
                     _loc11_.push(_loc13_);
                     param2[_loc13_.name] = 1;
                  }
                  else
                  {
                     _loc12_.push(_loc13_);
                  }
               }
               _loc8_++;
            }
            if(_loc11_.length > 0)
            {
               _loc8_ = 0;
               _loc9_ = int(_loc11_.length);
               while(_loc8_ < _loc9_)
               {
                  _loc14_ = this._11606(_loc7_,_loc11_[_loc8_],_loc10_);
                  param3.push(_loc14_);
                  _loc8_++;
               }
            }
            if(_loc12_.length > 0)
            {
               _loc8_ = 0;
               _loc9_ = int(_loc12_.length);
               while(_loc8_ < _loc9_)
               {
                  _loc14_ = this._11606(_loc7_,_loc12_[_loc8_],_loc10_);
                  param5.push(_loc14_);
                  _loc8_++;
               }
            }
         }
      }
      
      private function _11971(param1:Vector.<_13502>, param2:Vector.<_13502>, param3:Vector.<_13502>) : void
      {
         var armature:_50 = null;
         var taskQueue:_123 = null;
         var i:int = 0;
         var len:int = 0;
         var t:_11844 = null;
         var addAnimations:Vector.<_13502> = param1;
         var _11959:Vector.<_13502> = param2;
         var conflictAnimations:Vector.<_13502> = param3;
         if(Boolean(conflictAnimations) && conflictAnimations.length > 0)
         {
            _11844.num = conflictAnimations.length;
            armature = this._3979._2871._2865;
            taskQueue = new _123();
            taskQueue.addEventListener(_121.COMPLETE,function():void
            {
               _11844.type = _11844.TYPE_CUSTOME;
               _11608(addAnimations,_11959);
            });
            i = 0;
            len = int(conflictAnimations.length);
            while(i < len)
            {
               t = new _11844(conflictAnimations[i],addAnimations,_11959,armature);
               taskQueue._2389(t);
               i++;
            }
            taskQueue.run();
         }
         else
         {
            this._11608(addAnimations,_11959);
         }
      }
      
      private function _11608(param1:Vector.<_13502>, param2:Vector.<_13502>) : void
      {
         var _loc3_:_13544 = null;
         var _loc4_:_50 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Object = null;
         if(param1.length > 0)
         {
            if(!this._3979._3997)
            {
               return;
            }
            _loc3_ = this._3979._3997.source as _13544;
            _loc4_ = this._3979._2871._2865;
            _loc5_ = 0;
            _loc6_ = int(param1.length);
            while(_loc5_ < _loc6_)
            {
               this._11600(_loc4_,_loc3_,param1[_loc5_]);
               _loc5_++;
            }
            _loc7_ = !!this._3974 ? this._3974._1992.name : null;
            (_loc8_ = {}).armature = _loc4_;
            _loc8_.animations = param1;
            _loc8_._11959 = param2;
            _loc8_.curAnimation = null;
            _loc8_._2854 = null;
            if(Boolean(_loc7_) && param2.length > 0)
            {
               _loc5_ = 0;
               _loc6_ = int(param1.length);
               while(_loc5_ < _loc6_)
               {
                  if(param1[_loc5_].name == _loc7_)
                  {
                     _loc8_._2854 = param1[_loc5_];
                  }
                  _loc5_++;
               }
               _loc5_ = 0;
               _loc6_ = int(param2.length);
               while(_loc5_ < _loc6_)
               {
                  if(param2[_loc5_].name == _loc7_)
                  {
                     _loc8_.curAnimation = param2[_loc5_];
                  }
                  _loc5_++;
               }
            }
            _1567(new CommandNotification(CommandNotification.IMPORT_ANIMATION,_loc8_));
         }
      }
      
      private function _11606(param1:_50, param2:_13502, param3:_50) : _13502
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:_13504 = null;
         var _loc8_:_13504 = null;
         var _loc9_:_13508 = null;
         var _loc10_:_13508 = null;
         var _loc11_:_13507 = null;
         var _loc12_:_13507 = null;
         var _loc13_:_13509 = null;
         var _loc14_:_13509 = null;
         var _loc15_:_13506 = null;
         var _loc16_:_13506 = null;
         var _loc18_:Boolean = false;
         var _loc19_:_52 = null;
         var _loc20_:_79 = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:_70 = null;
         var _loc6_:_13502;
         (_loc6_ = new _13502()).currentPosition = param2.currentPosition;
         _loc6_._1870 = param2._1870;
         _loc6_.name = param2.name;
         _loc6_.frameRate = param2.frameRate;
         _loc6_.fadeInTime = param2.fadeInTime;
         _loc6_.playTimes = param2.playTimes;
         _loc6_._1746 = [];
         _loc6_._1745 = [];
         _loc6_._1753 = [];
         var _loc17_:Array = [];
         _loc4_ = 0;
         _loc5_ = int(param2._1746.length);
         while(_loc4_ < _loc5_)
         {
            _loc8_ = param2._1746[_loc4_] as _13504;
            if(_loc8_)
            {
               _loc7_ = this._11603(param1,_loc8_);
               if(_loc7_)
               {
                  _loc6_._1746.push(_loc7_);
               }
            }
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(param2._1745.length);
         while(_loc4_ < _loc5_)
         {
            _loc10_ = param2._1745[_loc4_] as _13508;
            if(_loc10_)
            {
               _loc9_ = this._11602(param1,_loc10_);
               if(_loc9_)
               {
                  _loc6_._1745.push(_loc9_);
               }
            }
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(param2._1753.length);
         while(_loc4_ < _loc5_)
         {
            _loc12_ = param2._1753[_loc4_] as _13507;
            if(_loc12_)
            {
               _loc11_ = this._11604(param1,_loc12_);
               if(_loc11_)
               {
                  _loc6_._1753.push(_loc11_);
               }
            }
            _loc4_++;
         }
         if(Boolean(param1._10658) && Boolean(param3._10658) && param1._10658.length == param3._10658.length)
         {
            _loc4_ = 0;
            _loc5_ = int(param1._10658.length);
            while(_loc4_ < _loc5_)
            {
               if(param1._10658[_loc4_] != param3._10658[_loc4_])
               {
                  _loc18_ = true;
                  break;
               }
               _loc4_++;
            }
         }
         if(Boolean(param2._10657) && param2._10657._1816.length > 0)
         {
            if(!_loc18_)
            {
               _loc14_ = param2._10657;
               _loc13_ = this._11601(param1,_loc14_);
               if(_loc13_)
               {
                  _loc6_._10657 = _loc13_;
               }
            }
         }
         if(Boolean(param2._13597) && param2._13597._1816.length > 0)
         {
            _loc16_ = param2._13597;
            _loc15_ = this._13779(param1,_loc16_);
            if(_loc15_)
            {
               _loc6_._13597 = _loc15_;
            }
         }
         else
         {
            _loc6_._13597 = new _13506(param1);
         }
         _loc4_ = 0;
         _loc5_ = int(param1._1779.length);
         while(_loc4_ < _loc5_)
         {
            _loc19_ = param1._1779[_loc4_] as _52;
            if(_loc6_._1873(_loc19_) == null)
            {
               _loc6_._1746.push(_13504._1869(_loc19_));
            }
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(param1._1780.length);
         while(_loc4_ < _loc5_)
         {
            _loc20_ = param1._1780[_loc4_] as _79;
            if(_loc6_._1875(_loc20_) == null)
            {
               _loc6_._1745.push(_13508._1869(_loc20_));
            }
            _loc21_ = 0;
            _loc21_ = 0;
            _loc22_ = int(_loc20_._1715.length);
            while(_loc21_ < _loc22_)
            {
               _loc23_ = _loc20_._1765[_loc20_._1715[_loc21_]] as _70;
               if((Boolean(_loc23_)) && _loc23_.type == _74.MESH)
               {
                  if(_loc6_._1881(_loc23_) == null)
                  {
                     _loc6_._1753.push(_13507._1869(_loc23_));
                  }
               }
               _loc21_++;
            }
            _loc4_++;
         }
         return _loc6_;
      }
      
      private function _11603(param1:_50, param2:_13504) : _13504
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_13504 = null;
         var _loc3_:_52 = param1._1817(param2._1823.name);
         if(_loc3_)
         {
            (_loc6_ = param2.clone() as _13504)._1823 = _loc3_;
         }
         return _loc6_;
      }
      
      private function _11602(param1:_50, param2:_13508) : _13508
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_13495 = null;
         var _loc7_:_13508 = null;
         var _loc8_:int = 0;
         var _loc3_:_79 = param1._1818(param2._1824.name);
         if(_loc3_)
         {
            (_loc7_ = param2.clone() as _13508)._1824 = _loc3_;
            _loc4_ = 0;
            _loc5_ = int(_loc7_._13572._1816.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_ = param2._13572._1816[_loc4_] as _13495;
               _loc8_ = -1;
               if(_loc6_._13613)
               {
                  _loc8_ = _loc6_._13613.displayIndex;
               }
               _loc6_ = _loc7_._13572._1816[_loc4_] as _13495;
               if(_loc6_)
               {
                  if(_loc8_ >= 0)
                  {
                     _loc6_.value = _loc3_._1715[_loc8_];
                  }
                  else
                  {
                     _loc6_.value = null;
                  }
               }
               _loc4_++;
            }
         }
         return _loc7_;
      }
      
      private function _11604(param1:_50, param2:_13507) : _13507
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:_70 = null;
         var _loc9_:Boolean = false;
         var _loc10_:_13507 = null;
         var _loc3_:_70 = param2._1826;
         var _loc4_:_79 = _loc3_._1760;
         var _loc5_:_79 = param1._1818(_loc4_.name);
         if(_loc5_)
         {
            _loc6_ = 0;
            _loc7_ = int(_loc5_._1715.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_ = _loc5_._1765[_loc5_._1715[_loc6_]];
               if(_loc8_ && _loc3_ && _loc8_.name == _loc3_.name && _loc8_.type == _74.MESH && _loc3_.type == _74.MESH && _loc8_.mesh && _loc3_.mesh && _loc8_.mesh.vertices.length == _loc3_.mesh.vertices.length)
               {
                  _loc9_ = true;
               }
               else
               {
                  _loc8_ = null;
               }
               _loc6_++;
            }
            if(_loc8_ == null || !_loc9_)
            {
               return null;
            }
            (_loc10_ = param2.clone() as _13507)._1826 = _loc8_;
            return _loc10_;
         }
         return null;
      }
      
      private function _11601(param1:_50, param2:_13509) : _13509
      {
         var _loc3_:_13509 = param2.clone() as _13509;
         _loc3_._1886 = param1;
         return _loc3_;
      }
      
      private function _13779(param1:_50, param2:_13506) : _13506
      {
         var _loc3_:_13506 = param2.clone() as _13506;
         _loc3_._1886 = param1;
         return _loc3_;
      }
      
      private function _11609(param1:MouseEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.DELETE_UNNECESSARY_FRAMES));
      }
      
      private function _4013(param1:ListEvent) : void
      {
         var _loc2_:_675 = param1.item as _675;
         if(Boolean(_loc2_) && _loc2_.parent != null)
         {
            _1567(new CommandNotification(CommandNotification.SELECT_ANIMATION,_loc2_._1992));
         }
         this._3975._3934(_711.ANIMATION_PANEL,_712.ANIMATION);
      }
      
      private function _3989() : void
      {
         this.animationPanel._4008.enabled = this.animationPanel._4019.enabled = this._3974 != null && !this._4018;
         this.animationPanel.renameBtn.enabled = Boolean(this._3974) && Boolean(this._3974.parent) && !this._4018;
         this.animationPanel._4020.enabled = !this._4018;
         this.animationPanel._4019.enabled = !this._4018 && this._3974 && Boolean(this._3974._1992.rootArmatureData) && this._3974._1992.rootArmatureData._13619.length > 1;
      }
      
      public function _3940() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = this._3974 && this._3974.parent && !this._4018;
         _loc1_[1] = this._3974 != null && !this._4018;
         _loc1_[2] = !this._4018;
         _loc1_[3] = !this._4018 && this._3974 && this._3974._1992.rootArmatureData && this._3974._1992.rootArmatureData._13619.length > 1;
         return _loc1_;
      }
      
      private function _4005(param1:FocusEvent) : void
      {
         var _loc3_:_221 = null;
         if(!this._3974)
         {
            return;
         }
         var _loc2_:int = int(this.animationPanel._4009.text);
         if(_loc2_ != this._3974._1992.playTimes)
         {
            _loc3_ = _221._1572(this._3974._1992,this._3974._1992.fadeInTime,_loc2_);
            _1567(new CommandNotification(CommandNotification.MODIFY_ANIMATION,_loc3_));
         }
      }
      
      private function _3999(param1:FocusEvent) : void
      {
         var _loc3_:_221 = null;
         if(!this._3974)
         {
            return;
         }
         var _loc2_:Number = Number(this.animationPanel._4010.text);
         if(isNaN(_loc2_))
         {
            _loc2_ = 0;
         }
         if(_loc2_ != this._3974._1992.fadeInTime)
         {
            _loc3_ = _221._1572(this._3974._1992,_loc2_,this._3974._1992.playTimes);
            _1567(new CommandNotification(CommandNotification.MODIFY_ANIMATION,_loc3_));
         }
      }
      
      private function _3988(param1:Event) : void
      {
      }
      
      private function _3985(param1:Event) : void
      {
      }
      
      private function _3984(param1:MouseEvent) : void
      {
         this._3987();
      }
      
      private function _4004(param1:MouseEvent) : void
      {
         if(!(param1.target is _1105 || param1.target is _1142))
         {
            return;
         }
         this._3987();
      }
      
      private function _3987() : void
      {
         var renameDialog:_174 = null;
         var onKeyDown:Function = null;
         if(Boolean(this._3974) && Boolean(this._3974.parent))
         {
            onKeyDown = function(param1:KeyboardEvent):void
            {
               var _loc2_:_223 = null;
               if(param1.keyCode == 13)
               {
                  if(renameDialog.value == "" || Boolean(checkSameName(renameDialog.value)))
                  {
                     return;
                  }
                  _loc2_ = new _223();
                  _loc2_._1896 = _3974._1992;
                  _loc2_.name = renameDialog.value;
                  _1567(new CommandNotification(CommandNotification.RENAME_ANIMATION,_loc2_));
                  renameDialog.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
                  renameDialog.close();
               }
            };
            renameDialog = new _174();
            renameDialog.title = tr("RenameWindow.title");
            renameDialog._2653 = tr("RenameWindow.newName");
            renameDialog.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
            renameDialog.value = this._3974.name;
            renameDialog._2651 = function(param1:String):String
            {
               var _loc2_:String = null;
               if(!param1)
               {
                  return "";
               }
               if(param1 == _3974.name)
               {
                  return tr("RenameWindow.error.same");
               }
               _loc2_ = checkSameName(param1);
               if(_loc2_ == null)
               {
                  _loc2_ = _12625(param1);
               }
               return _loc2_;
            };
            renameDialog.addEventListener(Event.CLOSE,this.onRenameClose);
            renameDialog.open();
         }
      }
      
      private function _12625(param1:String) : String
      {
         var _loc2_:int = int(param1.search(/[\/\\:*?\"' <>|.@#$%\^&!~]/));
         if(_loc2_ != -1)
         {
            return tr("Rename.invalid.name","/\\:*?\"\' <>|.@#$%^&!~");
         }
         return null;
      }
      
      private function checkSameName(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc4_:_13544 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:_13544 = this._3979._3997.source as _13544;
         var _loc5_:int = 0;
         if(_loc3_)
         {
            _loc6_ = 0;
            _loc7_ = int(_loc3_.children.length);
            while(_loc6_ < _loc7_)
            {
               _loc4_ = _loc3_.children[_loc6_] as _13544;
               if(_loc4_)
               {
                  if(_loc4_.name == param1)
                  {
                     _loc2_ = tr("Rename.animation.same");
                  }
               }
               _loc6_++;
            }
         }
         return _loc2_;
      }
      
      private function onRenameClose(param1:Event) : void
      {
         var _loc2_:_174 = param1.currentTarget as _174;
         var _loc3_:String = _loc2_.value;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:_223;
         (_loc4_ = new _223())._1896 = this._3974._1992;
         _loc4_.name = _loc3_;
         _1567(new CommandNotification(CommandNotification.RENAME_ANIMATION,_loc4_));
      }
      
      private function onDel(param1:MouseEvent) : void
      {
         var _loc2_:_50 = null;
         if(this._3974)
         {
            _loc2_ = this._3979._2871._2865;
            if(_loc2_._1963.length == 1)
            {
               return;
            }
            _1567(new CommandNotification(CommandNotification.DEL_ANIMATION,{
               "armature":_loc2_,
               "animation":this._3974._1992
            }));
         }
      }
      
      private function _4014(param1:MouseEvent) : void
      {
         var _loc2_:_50 = null;
         if(this._3974)
         {
            _loc2_ = this._3979._2871._2865;
            _1567(new CommandNotification(CommandNotification.DUP_ANIMATION,{
               "armature":_loc2_,
               "animation":this._3974._1992
            }));
         }
      }
      
      private function _4022(param1:MouseEvent) : void
      {
         if(!this._3979._3997)
         {
            return;
         }
         var _loc2_:_13544 = this._3979._3997.source as _13544;
         var _loc3_:_50 = this._3979._2871._2865;
         var _loc4_:String = this.getAnimationName(tr("Animation.add.name"),"_");
         var _loc5_:_13544 = this._3982(_loc3_,_loc2_,_loc4_);
         var _loc6_:_13502 = !!this._3974 ? this._3974._1992 : null;
         _1567(new CommandNotification(CommandNotification.ADD_ANIMATION,{
            "armature":_loc3_,
            "animation":[_loc6_,_loc5_._1992]
         }));
      }
      
      public function _2886() : void
      {
         var _loc3_:_13544 = null;
         var _loc1_:_13544 = this._3979._3997.source as _13544;
         var _loc2_:_50 = this._3979._2871._2865;
         for each(_loc3_ in _loc1_.children)
         {
            _loc3_._13785();
         }
         this.updateTree();
      }
      
      private function updateTree(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(param1 && this.animationPanel && this.animationPanel.tree && Boolean(this.animationPanel.tree._2490))
         {
            _loc2_ = this.animationPanel.tree._2490.verticalScrollPosition;
            _loc3_ = this.animationPanel.tree.selectedIndex;
         }
         this._3979._3997.refresh();
         if(param1 && this.animationPanel && this.animationPanel.tree && Boolean(this.animationPanel.tree._2490))
         {
            this.animationPanel.tree._2449();
            this.animationPanel.tree._2490.verticalScrollPosition = _loc2_;
            if(_loc3_ >= 0)
            {
               this.animationPanel.tree.selectedIndex = _loc3_;
            }
         }
      }
      
      public function modifyArmatureName(param1:_50) : void
      {
         var _loc2_:_13544 = this._3979._3997.source as _13544;
         if(_loc2_)
         {
            this._3979._3997._4016(_loc2_);
         }
      }
      
      public function delAnimation(param1:_13502) : _13544
      {
         var _loc2_:_13544 = _705._13784(param1);
         this._3979._3997.removeItem(_loc2_);
         this._3981();
         return _loc2_;
      }
      
      public function addAnimation(param1:_13502, param2:Boolean = true) : void
      {
         var _loc5_:_13544 = null;
         var _loc7_:_224 = null;
         var _loc3_:_13544 = _705._13784(param1);
         var _loc4_:_13544 = this._3979._3997.source as _13544;
         var _loc6_:int = 0;
         if(Boolean(_loc4_) && Boolean(_loc3_))
         {
            _loc3_.parent = _loc4_;
            _loc4_.children.push(_loc3_);
            _loc4_.children.sortOn("name");
         }
         this._3979._3997.refresh();
         if(param2)
         {
            _loc7_ = new _224();
            _loc7_._1572(_loc3_._1992);
            _loc7_.execute();
         }
      }
      
      public function duplicateAnimation(param1:_13502) : _13502
      {
         var _loc5_:_13546 = null;
         var _loc6_:_13544 = null;
         var _loc2_:_13544 = _705._13784(param1);
         var _loc3_:_13502 = param1.clone() as _13502;
         _loc3_.name = this.getAnimationName(param1.name,tr("Animation.duplicate.name"));
         if(_2220._2873 == _715.GENERAL)
         {
            _loc5_ = _705._13780(_loc3_);
         }
         else
         {
            _loc6_ = _705._13784(_loc3_);
         }
         var _loc4_:_50 = this._3979._2871._2865;
         _loc4_._13580(_loc3_);
         this.addAnimation(_loc3_,true);
         return _loc3_;
      }
      
      public function _2854(param1:_13502) : void
      {
         var _loc2_:_13544 = null;
         var _loc3_:Array = null;
         if(param1)
         {
            _loc2_ = _705._13784(param1);
            this._3974 = _loc2_;
            this.tree._2484 = this._3974;
            _loc3_ = this._3979._3993();
            this._3992 = _loc3_.indexOf(param1);
         }
         else
         {
            this._3974 = null;
            this.tree._2484 = null;
            this._3992 = -1;
         }
         this._3989();
         this.updateAnimationInfo();
      }
      
      public function rename(param1:_13502, param2:String) : void
      {
         var _loc3_:_13544 = _705._13784(param1);
         var _loc4_:_50 = _loc3_._1992.rootArmatureData;
         if(_loc4_)
         {
            if(_loc4_.defaultAnimation == _loc3_.name)
            {
               _loc4_.defaultAnimation = param2;
            }
         }
         param1.name = param2;
         this._3979._3997._4016(_loc3_);
      }
      
      public function getAnimationName(param1:String, param2:String) : String
      {
         var _loc3_:_50 = this._3979._2871._2865;
         var _loc4_:int = 1;
         var _loc5_:String = param1;
         while(_loc3_._1971(_loc5_))
         {
            _loc5_ = this.renameAniamtion(param1,param2,_loc4_);
            _loc4_++;
         }
         return _loc5_;
      }
      
      private function renameAniamtion(param1:String, param2:String, param3:int) : String
      {
         var _loc4_:int = param3;
         var _loc5_:Array = param1.split(param2);
         if(_loc5_.length > 1)
         {
            if(this.isNumFromName(_loc5_[_loc5_.length - 1]))
            {
               _loc4_ = int(_loc5_[_loc5_.length - 1]) + param3;
               _loc5_[_loc5_.length - 1] = _loc4_;
            }
            else
            {
               _loc5_.push(_loc4_);
            }
         }
         else
         {
            _loc5_.push(_loc4_);
         }
         return _loc5_.join(param2);
      }
      
      private function isNumFromName(param1:String) : Boolean
      {
         var _loc2_:int = param1.length - 1;
         while(_loc2_ >= 0)
         {
            if(int(param1.charAt(_loc2_)) <= 0 && param1.charAt(_loc2_) != "0")
            {
               return false;
            }
            _loc2_--;
         }
         return true;
      }
      
      private function getNumFromName(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.length - 1;
         while(_loc3_ >= 0)
         {
            if(int(param1.charAt(_loc3_)) <= 0 && param1.charAt(_loc3_) != "0")
            {
               break;
            }
            _loc3_--;
         }
         return int(param1.substring(_loc3_ + 1));
      }
      
      private function getStringFromName(param1:String) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.length - 1;
         while(_loc3_ >= 0)
         {
            if(int(param1.charAt(_loc3_)) <= 0 && param1.charAt(_loc3_) != "0")
            {
               break;
            }
            _loc3_--;
         }
         if(_loc3_ <= 0)
         {
            return param1;
         }
         return param1.substring(0,_loc3_ + 1);
      }
      
      private function _3552(param1:IndexChangeEvent) : void
      {
         var _loc2_:_702 = this.tree._2484;
         if(_loc2_ is _13544)
         {
            if(_13544(_loc2_).parent != null)
            {
               _1567(new CommandNotification(CommandNotification.SELECT_ANIMATION,(_loc2_ as _13544)._1992));
               this.updateAnimationInfo();
            }
            else
            {
               _1567(new CommandNotification(CommandNotification.SELECT_ANIMATION,null));
            }
         }
      }
      
      private function updateAnimationInfo() : void
      {
         var _loc1_:_13502 = null;
         var _loc2_:int = 0;
         if(this._3974)
         {
            _loc1_ = this._3974._1992;
            _loc2_ = _2214._1844._2871.dragonBonesVO.frameRate;
            if(Boolean(_loc1_) && Boolean(_loc1_.rootArmatureData))
            {
               _loc2_ = int(_loc1_.rootArmatureData.frameRate);
            }
            if(_loc2_ <= 0)
            {
               _loc2_ = int(Timeline.DEFAULT_FPS);
            }
            this.animationPanel._4011.text = (_loc1_.duration / _loc2_).toFixed(2) + "s";
            this.animationPanel._4010.text = _loc1_.fadeInTime.toString();
            this.animationPanel._4009.text = _loc1_.playTimes.toString();
         }
         this._3989();
      }
      
      public function modify(param1:_13502, param2:Number, param3:int) : void
      {
         var _loc4_:_13544 = _705._13784(param1);
         _loc4_._1992.fadeInTime = param2;
         _loc4_._1992.playTimes = param3;
         if(this._3974 == _loc4_)
         {
            this.updateAnimationInfo();
         }
      }
      
      private function get tree() : _163
      {
         return this.animationPanel.tree;
      }
      
      public function set _2871(param1:_665) : void
      {
         if(!param1)
         {
            return;
         }
         this._3979._2871 = param1;
         this.animationPanel.model = this._3979;
         this._3974 = null;
         this._3989();
         if(_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL)
         {
            this._3981();
            (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._2855();
         }
         else if(this._3974)
         {
            this._3974._1992._1868();
         }
      }
      
      private function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
      
      private function get _12950() : _12464
      {
         return _1407.getInstance(_12464) as _12464;
      }
   }
}

