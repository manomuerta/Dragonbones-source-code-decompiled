package _1162
{
   import _1146._1169;
   import _1148.Animation;
   import _1148._1149;
   import _1148._1150;
   import _1148._1152;
   import _1155._1158;
   import _1174._1173;
   import _1177.EffectEvent;
   import egret.core._1128;
   import egret.core.ns_egret;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   use namespace ns_egret;
   
   public class _1161 extends _1169
   {
      public var animation:Animation;
      
      private var _8861:Object;
      
      private var _8862:Number = 0;
      
      private var _8849:Boolean;
      
      private var _8751:int = 0;
      
      private var _3123:Number;
      
      private var _3121:Number;
      
      private var _8842:Object;
      
      private var _8758:Vector.<_1150>;
      
      public var _8756:Boolean;
      
      private var _8761:_1158;
      
      private var _8755:_1173;
      
      private var _8752:String;
      
      private var _8847:Object;
      
      public function _1161(param1:Object)
      {
         this._8861 = new Object();
         super(param1);
      }
      
      public function get motionPaths() : Vector.<_1150>
      {
         return this._8758;
      }
      
      public function set motionPaths(param1:Vector.<_1150>) : void
      {
         if(!this._8758)
         {
            this._8758 = param1;
         }
      }
      
      public function set _3772(param1:_1158) : void
      {
         this._8761 = param1;
      }
      
      public function get _3772() : _1158
      {
         return this._8761;
      }
      
      public function set _8759(param1:_1173) : void
      {
         this._8755 = param1;
      }
      
      public function get _8759() : _1173
      {
         return this._8755;
      }
      
      public function set _8753(param1:String) : void
      {
         this._8752 = param1;
      }
      
      public function get _8753() : String
      {
         return this._8752;
      }
      
      override ns_egret function set _8807(param1:Boolean) : void
      {
         super.ns_egret::_8807 = param1;
         if(param1 && Boolean(this.animation))
         {
            this.animation.ns_egret::reverse();
         }
         this._8849 = param1;
      }
      
      override public function get _8324() : Number
      {
         return !!this.animation ? this.animation._8324 : this._8862;
      }
      
      override public function set _8324(param1:Number) : void
      {
         if(this.animation)
         {
            this.animation._8324 = param1;
         }
         this._8862 = param1;
      }
      
      override public function pause() : void
      {
         super.pause();
         if(this.animation)
         {
            this.animation.pause();
         }
      }
      
      override public function stop() : void
      {
         super.stop();
         if(this.animation)
         {
            this.animation.stop();
         }
      }
      
      override public function resume() : void
      {
         super.resume();
         if(this.animation)
         {
            this.animation.resume();
         }
      }
      
      override public function reverse() : void
      {
         super.reverse();
         if(this.animation)
         {
            this.animation.ns_egret::reverse();
         }
         this._8849 = !this._8849;
      }
      
      override public function end() : void
      {
         if(this.animation)
         {
            this.animation.end();
            this.animation = null;
         }
         super.end();
      }
      
      override public function _8837() : void
      {
         this.play();
      }
      
      override public function play() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Timer = null;
         var _loc6_:_1150 = null;
         var _loc7_:Vector.<_1149> = null;
         super.play();
         if(!this.motionPaths || this.motionPaths.length == 0)
         {
            _loc5_ = new Timer(duration,1);
            _loc5_.addEventListener(TimerEvent.TIMER,this._8843);
            _loc5_.start();
            return;
         }
         this._8861 = new Array(this.motionPaths.length);
         _loc3_ = 0;
         while(_loc3_ < this.motionPaths.length)
         {
            _loc6_ = _1150(this.motionPaths[_loc3_]);
            if(_loc7_ = _loc6_._8781)
            {
               if(this._8759)
               {
                  _loc6_._8759 = this._8759;
               }
               if(duration > 0)
               {
                  _loc4_ = 0;
                  while(_loc4_ < _loc7_.length)
                  {
                     if(!isNaN(_loc7_[_loc4_].time))
                     {
                        duration = Math.max(duration,_loc7_[_loc4_].time);
                     }
                     _loc4_++;
                  }
               }
            }
            _loc3_++;
         }
         if(_loc1_)
         {
            this.motionPaths.push(new _1152("width"));
         }
         if(_loc2_)
         {
            this.motionPaths.push(new _1152("height"));
         }
         this.animation = new Animation(this._8854);
         this.animation.duration = this.duration;
         this.animation.startFunction = this._8856;
         this.animation.endFunction = this._8808;
         this.animation.stopFunction = this._8802;
         this.animation.repeatFunction = this._8853;
         this.animation.motionPaths = this.motionPaths;
         if(this._8849)
         {
            this.animation._8807 = true;
         }
         this.animation._8759 = this._8759;
         this.animation.repeatCount = repeatCount;
         this.animation.repeatDelay = repeatDelay;
         this.animation._8753 = this._8753;
         this.animation._3772 = this._3772;
         this.animation.startDelay = startDelay;
         this.animation.play();
         if(this._8862 > 0)
         {
            this.animation._8324 = this._8862;
         }
      }
      
      protected function _8860(param1:Animation) : void
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.motionPaths.length)
         {
            _loc3_ = this.motionPaths[_loc2_].property;
            this.setValue(_loc3_,param1._2584[_loc3_]);
            _loc2_++;
         }
      }
      
      private function _8858(param1:Object) : Boolean
      {
         return param1 is Number && !isNaN(Number(param1)) || !(param1 is Number) && param1 !== null;
      }
      
      private function _8857() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Object = null;
         var _loc4_:_1150 = null;
         var _loc5_:Vector.<_1149> = null;
         var _loc6_:_1149 = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.motionPaths.length)
         {
            _loc4_ = _1150(this.motionPaths[_loc3_]);
            if(!(!(_loc5_ = _loc4_._8781) || _loc5_.length == 0))
            {
               if(!this._8858(_loc5_[0].value))
               {
                  if(_loc5_.length > 0 && this._8858(_loc5_[1]._8782) && this._8858(_loc5_[1].value))
                  {
                     _loc5_[0].value = _loc4_._8759.decrement(_loc5_[1].value,_loc5_[1]._8782);
                  }
                  else
                  {
                     _loc5_[0].value = this._8852(_loc4_.property);
                  }
               }
               _loc2_ = _loc5_[0].value;
               _loc1_ = 1;
               while(_loc1_ < _loc5_.length)
               {
                  _loc6_ = _1149(_loc5_[_loc1_]);
                  if(!this._8858(_loc6_.value))
                  {
                     if(this._8858(_loc6_._8782))
                     {
                        _loc6_.value = _loc4_._8759.increment(_loc2_,_loc6_._8782);
                     }
                     else if(_loc1_ <= _loc5_.length - 2 && this._8858(_loc5_[_loc1_ + 1].value) && this._8858(_loc5_[_loc1_ + 1]._8782))
                     {
                        _loc6_.value = _loc4_._8759.decrement(_loc5_[_loc1_ + 1].value,_loc5_[_loc1_ + 1]._8782);
                     }
                     else
                     {
                        _loc6_.value = _loc2_;
                     }
                  }
                  _loc2_ = _loc6_.value;
                  _loc1_++;
               }
            }
            _loc3_++;
         }
      }
      
      public function _8856(param1:Animation) : void
      {
         var _loc2_:String = null;
         if(this._8756)
         {
            this._8848(false);
            this._8851();
         }
         else if(this._8842)
         {
            for(_loc2_ in this._8842)
            {
               this._8855(_loc2_);
            }
            this._8842 = null;
         }
         this._8857();
      }
      
      public function _8854(param1:Animation) : void
      {
         var _loc2_:EffectEvent = null;
         this._8860(param1);
         if(this._8751 > 0)
         {
            _loc2_ = new EffectEvent(EffectEvent.EFFECT_UPDATE);
            _loc2_._8775 = this;
            dispatchEvent(_loc2_);
         }
      }
      
      public function _8853(param1:Animation) : void
      {
         var _loc2_:EffectEvent = new EffectEvent(EffectEvent.EFFECT_REPEAT);
         _loc2_._8775 = this;
         dispatchEvent(_loc2_);
      }
      
      private function _8850() : void
      {
         if(this._8756)
         {
            this._8844();
            this._8848(true);
         }
      }
      
      public function _8808(param1:Animation) : void
      {
         this._8850();
         _8859();
      }
      
      public function _8802(param1:Animation) : void
      {
         this._8850();
      }
      
      private function _8843(param1:TimerEvent) : void
      {
         _8859();
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         if(param1 == EffectEvent.EFFECT_UPDATE)
         {
            ++this._8751;
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(param1 == EffectEvent.EFFECT_UPDATE)
         {
            --this._8751;
         }
      }
      
      private function _8845(param1:String) : *
      {
         var _loc2_:* = this._8847[param1];
         if(_loc2_ !== undefined)
         {
            if(param1 in target)
            {
               target[param1] = _loc2_;
            }
            else
            {
               target.setStyle(param1,_loc2_);
            }
            delete this._8847[param1];
         }
         return _loc2_;
      }
      
      private function _8844() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(this._8847)
         {
            _loc1_ = this._8845("left");
            _loc2_ = this._8845("right");
            _loc3_ = this._8845("top");
            _loc4_ = this._8845("bottom");
            this._8845("horizontalCenter");
            this._8845("verticalCenter");
            this._8847 = null;
            if(_loc1_ != undefined && _loc2_ != undefined && "explicitWidth" in target)
            {
               target.width = this._3123;
            }
            if(_loc3_ != undefined && _loc4_ != undefined && "explicitHeight" in target)
            {
               target.height = this._3121;
            }
         }
      }
      
      private function _8855(param1:String) : *
      {
         var _loc3_:* = undefined;
         var _loc2_:* = param1 in target;
         if(_loc2_)
         {
            _loc3_ = target[param1];
         }
         else
         {
            _loc3_ = target.getStyle(param1);
         }
         if(!isNaN(_loc3_) && _loc3_ != null)
         {
            if(!this._8847)
            {
               this._8847 = {};
            }
            this._8847[param1] = _loc3_;
            if(_loc2_)
            {
               target[param1] = NaN;
            }
            else if(target is _1128)
            {
               target.setStyle(param1,undefined);
            }
         }
         return _loc3_;
      }
      
      private function _8851() : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:* = this._8855("left");
         var _loc2_:* = this._8855("right");
         var _loc3_:* = this._8855("top");
         var _loc4_:* = this._8855("bottom");
         this._8855("verticalCenter");
         this._8855("horizontalCenter");
         if(_loc1_ != undefined && _loc2_ != undefined && "explicitWidth" in target)
         {
            _loc5_ = Number(target.width);
            this._3123 = target.explicitWidth;
            target.width = _loc5_;
         }
         if(_loc3_ != undefined && _loc4_ != undefined && "explicitHeight" in target)
         {
            _loc6_ = Number(target.height);
            this._3121 = target.explicitHeight;
            target.height = _loc6_;
         }
      }
      
      private function _8848(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if("parent" in target && Boolean(target.parent))
         {
            _loc2_ = target.parent;
         }
         if(_loc2_ && "autoLayout" in _loc2_)
         {
            _loc2_.autoLayout = param1;
         }
      }
      
      protected function _8846(param1:String) : void
      {
         var property:String = param1;
         if(this._8861[property] == undefined)
         {
            if(property in target)
            {
               this._8861[property] = false;
            }
            else
            {
               try
               {
                  target.getStyle(property);
                  this._8861[property] = true;
               }
               catch(err:Error)
               {
                  throw new Error("propNotPropOrStyle");
               }
            }
         }
      }
      
      protected function setValue(param1:String, param2:Object) : void
      {
         this._8846(param1);
         if(!this._8861[param1])
         {
            target[param1] = param2;
         }
         else
         {
            target.setStyle(param1,param2);
         }
      }
      
      protected function _8852(param1:String) : *
      {
         this._8846(param1);
         if(!this._8861[param1])
         {
            return target[param1];
         }
         return target.getStyle(param1);
      }
   }
}

