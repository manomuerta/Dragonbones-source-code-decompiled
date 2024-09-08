package _214
{
   import _40.BoneFrameVO;
   import _40._10598;
   import _40._42;
   import _40._45;
   import _40._47;
   
   public class _215
   {
      public var bones:Object;
      
      public var slots:Object;
      
      public var _2851:Object;
      
      public var event:Array;
      
      public var zOrder:Array;
      
      private var _2849:Vector.<BoneFrameVO>;
      
      private var _2848:Vector.<_47>;
      
      private var _2850:Vector.<_42>;
      
      private var _2846:Vector.<_45>;
      
      private var _10685:Vector.<_10598>;
      
      private var _2839:int;
      
      public function _215()
      {
         this.bones = {};
         this.slots = {};
         this._2851 = {};
         this.event = [];
         this.zOrder = [];
         this._2849 = new Vector.<BoneFrameVO>();
         this._2848 = new Vector.<_47>();
         this._2850 = new Vector.<_42>();
         this._2846 = new Vector.<_45>();
         this._10685 = new Vector.<_10598>();
         super();
      }
      
      private function _2843() : BoneFrameVO
      {
         if(this._2849.length > 0)
         {
            return this._2849.pop();
         }
         return new BoneFrameVO(null,true,-1);
      }
      
      private function _2842() : _47
      {
         if(this._2848.length > 0)
         {
            return this._2848.pop();
         }
         return new _47(null,true,-1);
      }
      
      private function _2844() : _42
      {
         if(this._2850.length > 0)
         {
            return this._2850.pop();
         }
         return new _42(null,true,-1);
      }
      
      private function _2841() : _45
      {
         if(this._2846.length > 0)
         {
            return this._2846.pop();
         }
         return new _45(true,-1);
      }
      
      private function _10684() : _10598
      {
         if(this._10685.length > 0)
         {
            return this._10685.pop();
         }
         return new _10598(-1);
      }
      
      private function clear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         for each(_loc3_ in this.bones)
         {
            _loc1_ = 0;
            _loc2_ = int(_loc3_.length);
            while(_loc1_ < _loc2_)
            {
               this._2849.push(_loc3_[_loc1_] as BoneFrameVO);
               _loc1_++;
            }
         }
         this.bones = {};
         for each(_loc3_ in this.slots)
         {
            _loc1_ = 0;
            _loc2_ = int(_loc3_.length);
            while(_loc1_ < _loc2_)
            {
               this._2848.push(_loc3_[_loc1_] as _47);
               _loc1_++;
            }
         }
         this.slots = {};
         for each(_loc3_ in this._2851)
         {
            _loc1_ = 0;
            _loc2_ = int(_loc3_.length);
            while(_loc1_ < _loc2_)
            {
               if(_loc3_[_loc1_] is _42)
               {
                  this._2850.push(_loc3_[_loc1_] as _42);
               }
               _loc1_++;
            }
         }
         this._2851 = {};
         _loc3_ = this.event;
         _loc1_ = 0;
         _loc2_ = int(_loc3_.length);
         while(_loc1_ < _loc2_)
         {
            this._2846.push(_loc3_[_loc1_] as _45);
            _loc1_++;
         }
         this.event.length = 0;
         _loc3_ = this.zOrder;
         _loc1_ = 0;
         _loc2_ = int(_loc3_.length);
         while(_loc1_ < _loc2_)
         {
            this._10685.push(_loc3_[_loc1_] as _10598);
            _loc1_++;
         }
         this.zOrder.length = 0;
         this._2839 = int.MAX_VALUE;
      }
      
      public function _2847() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc1_:int = 0;
         for each(_loc4_ in this.bones)
         {
            _loc2_ = 0;
            _loc3_ = int(_loc4_.length);
            while(_loc2_ < _loc3_)
            {
               _loc1_++;
               if(_loc1_ > 1)
               {
                  return false;
               }
               _loc2_++;
            }
         }
         for each(_loc4_ in this.slots)
         {
            _loc2_ = 0;
            _loc3_ = int(_loc4_.length);
            while(_loc2_ < _loc3_)
            {
               _loc1_++;
               if(_loc1_ > 1)
               {
                  return false;
               }
               _loc2_++;
            }
         }
         for each(_loc4_ in this._2851)
         {
            _loc2_ = 0;
            _loc3_ = int(_loc4_.length);
            while(_loc2_ < _loc3_)
            {
               _loc1_++;
               if(_loc1_ > 1)
               {
                  return false;
               }
               _loc2_++;
            }
         }
         _loc4_ = this.zOrder;
         _loc2_ = 0;
         _loc3_ = int(_loc4_.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_++;
            if(_loc1_ > 1)
            {
               return false;
            }
            _loc2_++;
         }
         _loc4_ = this.event;
         _loc2_ = 0;
         _loc3_ = int(_loc4_.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_++;
            if(_loc1_ > 1)
            {
               return false;
            }
            _loc2_++;
         }
         if(_loc1_ == 1)
         {
            return true;
         }
         return false;
      }
      
      public function _2840() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         for each(_loc4_ in this.bones)
         {
            _loc1_++;
            if(_loc1_ > 1)
            {
               return false;
            }
         }
         for each(_loc4_ in this.slots)
         {
            _loc1_++;
            if(_loc1_ > 1)
            {
               return false;
            }
         }
         for each(_loc4_ in this._2851)
         {
            _loc1_++;
            if(_loc1_ > 1)
            {
               return false;
            }
         }
         _loc4_ = this.zOrder;
         if(_loc4_.length > 0)
         {
            _loc1_++;
            if(_loc1_ > 1)
            {
               return false;
            }
         }
         _loc4_ = this.event;
         if(_loc4_.length > 0)
         {
            _loc1_++;
            if(_loc1_ > 1)
            {
               return false;
            }
         }
         if(_loc1_ == 1)
         {
            return true;
         }
         return false;
      }
      
      public function _2838(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:BoneFrameVO = null;
         var _loc7_:BoneFrameVO = null;
         var _loc8_:_47 = null;
         var _loc9_:_47 = null;
         var _loc10_:_42 = null;
         var _loc11_:_42 = null;
         var _loc12_:_45 = null;
         var _loc13_:_45 = null;
         var _loc14_:_45 = null;
         var _loc15_:_45 = null;
         var _loc16_:String = null;
         this.clear();
         if(param1.bones)
         {
            for(_loc5_ in param1.bones)
            {
               if(this.bones[_loc5_] == null)
               {
                  this.bones[_loc5_] = [];
               }
               _loc4_ = param1.bones[_loc5_];
               _loc2_ = 0;
               _loc3_ = int(_loc4_.length);
               while(_loc2_ < _loc3_)
               {
                  _loc6_ = _loc4_[_loc2_] as BoneFrameVO;
                  if(_loc6_.startPos < this._2839)
                  {
                     this._2839 = _loc6_.startPos;
                  }
                  _loc7_ = this._2843();
                  _loc7_.copyFrom(_loc6_);
                  this.bones[_loc5_].push(_loc7_);
                  _loc2_++;
               }
            }
         }
         if(param1.slots)
         {
            for(_loc5_ in param1.slots)
            {
               if(this.slots[_loc5_] == null)
               {
                  this.slots[_loc5_] = [];
               }
               _loc4_ = param1.slots[_loc5_];
               _loc2_ = 0;
               _loc3_ = int(_loc4_.length);
               while(_loc2_ < _loc3_)
               {
                  _loc8_ = _loc4_[_loc2_] as _47;
                  if(_loc8_.startPos < this._2839)
                  {
                     this._2839 = _loc8_.startPos;
                  }
                  _loc9_ = this._2842();
                  _loc9_.copyFrom(_loc8_);
                  this.slots[_loc5_].push(_loc9_);
                  _loc2_++;
               }
            }
         }
         if(param1._2851)
         {
            for(_loc16_ in param1._2851)
            {
               if(this._2851[_loc16_] == null)
               {
                  this._2851[_loc16_] = [];
               }
               for(_loc5_ in param1._2851[_loc16_])
               {
                  if(this._2851[_loc16_][_loc5_] == null)
                  {
                     this._2851[_loc16_][_loc5_] = [];
                  }
                  _loc4_ = param1._2851[_loc16_][_loc5_];
                  _loc2_ = 0;
                  _loc3_ = int(_loc4_.length);
                  while(_loc2_ < _loc3_)
                  {
                     _loc10_ = _loc4_[_loc2_] as _42;
                     if(_loc10_.startPos < this._2839)
                     {
                        this._2839 = _loc10_.startPos;
                     }
                     _loc11_ = this._2844();
                     _loc11_.copyFrom(_loc10_);
                     this._2851[_loc16_][_loc5_].push(_loc11_);
                     _loc2_++;
                  }
               }
            }
         }
         if(param1.event)
         {
            _loc4_ = param1.event;
            _loc2_ = 0;
            _loc3_ = int(_loc4_.length);
            while(_loc2_ < _loc3_)
            {
               _loc12_ = _loc4_[_loc2_] as _45;
               if(_loc12_.startPos < this._2839)
               {
                  this._2839 = _loc12_.startPos;
               }
               _loc13_ = this._2841();
               _loc13_.copyFrom(_loc12_);
               this.event.push(_loc13_);
               _loc2_++;
            }
         }
         if(param1.zOrder)
         {
            _loc4_ = param1.zOrder;
            _loc2_ = 0;
            _loc3_ = int(_loc4_.length);
            while(_loc2_ < _loc3_)
            {
               _loc14_ = _loc4_[_loc2_] as _10598;
               if(_loc14_.startPos < this._2839)
               {
                  this._2839 = _loc14_.startPos;
               }
               _loc15_ = this._10684();
               _loc15_.copyFrom(_loc14_);
               this.zOrder.push(_loc15_);
               _loc2_++;
            }
         }
      }
      
      public function _2845(param1:int) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_45 = null;
         var _loc5_:_45 = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc6_:Object = {
            "bones":{},
            "slots":{},
            "_2851":{},
            "event":[],
            "zOrder":[]
         };
         var _loc9_:int = param1 - this._2839;
         for(_loc7_ in this.bones)
         {
            if(_loc6_.bones[_loc7_] == null)
            {
               _loc6_.bones[_loc7_] = [];
            }
            _loc2_ = 0;
            _loc3_ = int(this.bones[_loc7_].length);
            while(_loc2_ < _loc3_)
            {
               _loc5_ = this.bones[_loc7_][_loc2_].clone();
               _loc5_.startPos += _loc9_;
               _loc6_.bones[_loc7_].push(_loc5_);
               _loc2_++;
            }
         }
         for(_loc7_ in this.slots)
         {
            if(_loc6_.slots[_loc7_] == null)
            {
               _loc6_.slots[_loc7_] = [];
            }
            _loc2_ = 0;
            _loc3_ = int(this.slots[_loc7_].length);
            while(_loc2_ < _loc3_)
            {
               _loc5_ = this.slots[_loc7_][_loc2_].clone();
               _loc5_.startPos += _loc9_;
               _loc6_.slots[_loc7_].push(_loc5_);
               _loc2_++;
            }
         }
         for(_loc8_ in this._2851)
         {
            if(_loc6_._2851[_loc8_] == null)
            {
               _loc6_._2851[_loc8_] = [];
            }
            for(_loc7_ in this._2851[_loc8_])
            {
               if(_loc6_._2851[_loc8_][_loc7_] == null)
               {
                  _loc6_._2851[_loc8_][_loc7_] = [];
               }
               _loc2_ = 0;
               _loc3_ = int(this._2851[_loc8_][_loc7_].length);
               while(_loc2_ < _loc3_)
               {
                  _loc5_ = this._2851[_loc8_][_loc7_][_loc2_].clone();
                  _loc5_.startPos += _loc9_;
                  _loc6_._2851[_loc8_][_loc7_].push(_loc5_);
                  _loc2_++;
               }
            }
         }
         _loc2_ = 0;
         _loc3_ = int(this.zOrder.length);
         while(_loc2_ < _loc3_)
         {
            _loc5_ = this.zOrder[_loc2_].clone();
            _loc5_.startPos += _loc9_;
            _loc6_.zOrder.push(_loc5_);
            _loc2_++;
         }
         _loc2_ = 0;
         _loc3_ = int(this.event.length);
         while(_loc2_ < _loc3_)
         {
            _loc5_ = this.event[_loc2_].clone();
            _loc5_.startPos += _loc9_;
            _loc6_.event.push(_loc5_);
            _loc2_++;
         }
         return _loc6_;
      }
   }
}

