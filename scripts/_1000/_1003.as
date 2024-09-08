package _1000
{
   import _1045.Group;
   import _724._11251;
   import _724._14085;
   import _724._14087;
   import _724._723;
   import _724._725;
   import _724._726;
   import _724._732;
   import _872._1005;
   import egret.core._1133;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _1003 extends Group
   {
      private const MAX_SIZE:int = 300;
      
      private var _7014:_1002;
      
      private var _14856:_14112;
      
      private var _7011:_1001;
      
      private var _7009:_1004;
      
      private var _11481:_11268;
      
      private var _14010:_1005;
      
      public var _5453:_999;
      
      private var _2101:_725;
      
      private var _5456:Number;
      
      private var _5457:Number;
      
      private var _5451:Number;
      
      private var _5458:Number;
      
      private var _5459:Number;
      
      private var _5450:Number;
      
      private var _5449:Number;
      
      private var _5448:Number;
      
      private var _5447:Number;
      
      public function _1003()
      {
         super();
         this._7014 = new _1002();
         this._14856 = new _14112();
         this._7011 = new _1001();
         this._7009 = new _1004();
         this._11481 = new _11268();
         this._14010 = new _1005();
      }
      
      public function _5445(param1:_725, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number) : void
      {
         this._2101 = param1;
         this._5456 = param2;
         this._5457 = param3;
         this._5451 = param4;
         this._5458 = param5;
         this._5459 = param6;
         this._5450 = param7;
         this._5449 = param8;
         this._5448 = param9;
         this._5447 = param10;
         this._5453 = null;
         if(param1 is _732)
         {
            this._7014._2104 = param1;
            this._7014.addEventListener(Event.CHANGE,this._7010);
            this._5453 = this._7014;
         }
         else if(param1 is _723)
         {
            this._7011._2104 = param1;
            this._7011.addEventListener(Event.CHANGE,this._7010);
            this._5453 = this._7011;
         }
         else if(param1 is _726 || param1 is _14087)
         {
            this._7009._2104 = param1;
            this._7009.addEventListener(Event.CHANGE,this._7010);
            this._5453 = this._7009;
         }
         else if(!(param1 is _11251))
         {
            if(param1 is _14085)
            {
               this._14856._2104 = param1;
               this._14856.addEventListener(Event.CHANGE,this._7010);
               this._5453 = this._14856;
            }
         }
         if(this._5453)
         {
            this._5088();
         }
      }
      
      private function _7010(param1:Event) : void
      {
         this._5088();
      }
      
      private function _7015(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:Number = 1;
         var _loc11_:Number = Math.min(param1,this.MAX_SIZE);
         if(_loc11_ < this._5453._7003)
         {
            _loc10_ = _loc11_ / this._5453._7003;
         }
         var _loc12_:Number = Math.min(param5,this.MAX_SIZE) / this._5453._7002;
         if(_loc10_ > _loc12_)
         {
            _loc10_ = _loc12_;
         }
         this._5453._6106(_loc10_);
         this._5453.x = param1 - this._5453.width - 5;
         if(param2 + this._5453.height > param5)
         {
            param2 = param5 - this._5453.height;
         }
         this._5453.y = param2;
         addElement(this._5453 as _1133);
      }
      
      private function _7013(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:Number = 1;
         var _loc11_:Number = Math.min(param4 - param1 - param3,this.MAX_SIZE);
         if(_loc11_ < this._5453._7003)
         {
            _loc10_ = _loc11_ / this._5453._7003;
         }
         var _loc12_:Number = Math.min(param5,this.MAX_SIZE) / this._5453._7002;
         if(_loc10_ > _loc12_)
         {
            _loc10_ = _loc12_;
         }
         this._5453._6106(_loc10_);
         this._5453.x = param1 + param3 + 5;
         if(param2 + this._5453.height > param5)
         {
            param2 = param5 - this._5453.height;
         }
         this._5453.y = param2;
         addElement(this._5453 as _1133);
      }
      
      private function _7016(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:Number = 1;
         var _loc11_:Number = Math.min(param7,this.MAX_SIZE);
         if(_loc11_ < this._5453._7002)
         {
            _loc10_ = _loc11_ / this._5453._7002;
         }
         var _loc12_:Number = Math.min(param4,this.MAX_SIZE) / this._5453._7003;
         if(_loc10_ > _loc12_)
         {
            _loc10_ = _loc12_;
         }
         this._5453._6106(_loc10_);
         if(param1 + this._5453.width > param4)
         {
            param1 = param4 - this._5453.width;
         }
         this._5453.x = param1;
         this._5453.y = param7 - this._5453.height - 5;
         addElement(this._5453 as _1133);
      }
      
      private function _7012(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:Number = 1;
         var _loc11_:Number = Math.min(param5 - param7 - param9,this.MAX_SIZE);
         if(_loc11_ < this._5453._7002)
         {
            _loc10_ = _loc11_ / this._5453._7002;
         }
         var _loc12_:Number = Math.min(param4,this.MAX_SIZE) / this._5453._7003;
         if(_loc10_ > _loc12_)
         {
            _loc10_ = _loc12_;
         }
         this._5453._6106(_loc10_);
         if(param1 + this._5453.width > param4)
         {
            param1 = param4 - this._5453.width;
         }
         this._5453.x = param1;
         this._5453.y = param7 + param9 + 10;
         addElement(this._5453 as _1133);
      }
      
      private function _5088() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:int = 100;
         if(this._5456 + this._5451 + _loc1_ > this._5458 && this._5456 - _loc1_ < 0)
         {
            if(this._5449 - _loc1_ < 0)
            {
               this._7012(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
            }
            else
            {
               this._7016(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
            }
         }
         else if(this._5456 + this._5451 + _loc1_ > this._5458)
         {
            this._7015(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
         }
         else if(this._5456 - _loc1_ < 0)
         {
            this._7013(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
         }
         else if(this._5456 > this._5453._7003)
         {
            this._7015(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
         }
         else if(this._5458 - this._5456 - this._5451 > this._5453._7003)
         {
            this._7013(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
         }
         else if(this._5449 > this._5453._7002)
         {
            this._7016(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
         }
         else if(this._5459 - this._5449 - this._5447 > this._5453._7002)
         {
            this._7012(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
         }
         else
         {
            _loc2_ = 0;
            if(_loc2_ < this._5456)
            {
               _loc2_ = this._5456;
            }
            if(_loc2_ < this._5458 - this._5456 - this._5451)
            {
               _loc2_ = this._5458 - this._5456 - this._5451;
            }
            if(_loc2_ < this._5449)
            {
               _loc2_ = this._5449;
            }
            if(_loc2_ < this._5459 - this._5449 - this._5447)
            {
               _loc2_ = this._5459 - this._5449 - this._5447;
            }
            if(_loc2_ == this._5456)
            {
               this._7015(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
            }
            else if(_loc2_ == this._5458 - this._5456 - this._5451)
            {
               this._7013(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
            }
            else if(_loc2_ == this._5449)
            {
               this._7016(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
            }
            else if(_loc2_ == this._5459 - this._5449 - this._5447)
            {
               this._7012(this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
            }
         }
      }
      
      public function _5446() : void
      {
         this._7014._2104 = null;
         this._7014.removeEventListener(Event.CHANGE,this._7010);
         if(this._7014.parent)
         {
            removeElement(this._7014);
         }
         this._14856._2104 = null;
         this._14856.removeEventListener(Event.CHANGE,this._7010);
         if(this._14856.parent)
         {
            removeElement(this._14856);
         }
         this._7011._2104 = null;
         this._7011.removeEventListener(Event.CHANGE,this._7010);
         if(this._7011.parent)
         {
            removeElement(this._7011);
         }
         this._7009._2104 = null;
         this._7009.removeEventListener(Event.CHANGE,this._7010);
         if(this._7009.parent)
         {
            removeElement(this._7009);
         }
         this._11481._2104 = null;
         this._11481.removeEventListener(Event.CHANGE,this._7010);
         if(this._11481.parent)
         {
            removeElement(this._11481);
         }
      }
      
      public function _13908(param1:String, param2:Number, param3:Number) : void
      {
         this._14010.showText = param1;
         this._14010.x = param2;
         this._14010.y = param3;
         this.addElement(this._14010);
      }
      
      public function _13907() : void
      {
         this._14010.showText = "";
         if(this.getElementIndex(this._14010) != -1)
         {
            this.removeElement(this._14010);
         }
      }
      
      public function _13905(param1:MouseEvent, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 8;
         var _loc7_:int = 8;
         if(param1.stageX > param2 - this._14010.width + _loc6_)
         {
            _loc4_ = param2 - this._14010.width - _loc6_;
         }
         else
         {
            _loc4_ = param1.stageX + _loc6_;
         }
         if(param1.stageY > param3 - this._14010.height + _loc7_)
         {
            _loc5_ = param3 - this._14010.height - _loc7_;
         }
         else
         {
            _loc5_ = param1.stageY + _loc7_;
         }
         this._14010.x = _loc4_;
         this._14010.y = _loc5_;
      }
   }
}

