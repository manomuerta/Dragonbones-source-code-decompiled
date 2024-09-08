package _1215
{
   import egret.managers._1205;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   
   public class _1214
   {
      private var _9016:Array;
      
      private var _9017:int = 0;
      
      private var _9018:int = -1;
      
      public function _1214()
      {
         this._9016 = [];
         super();
      }
      
      public function insert(param1:_1205) : void
      {
         var _loc2_:int = param1._7569;
         if(this._9018 < this._9017)
         {
            this._9017 = this._9018 = _loc2_;
         }
         else
         {
            if(_loc2_ < this._9017)
            {
               this._9017 = _loc2_;
            }
            if(_loc2_ > this._9018)
            {
               this._9018 = _loc2_;
            }
         }
         var _loc3_:DepthBin = this._9016[_loc2_];
         if(!_loc3_)
         {
            _loc3_ = new DepthBin();
            this._9016[_loc2_] = _loc3_;
            _loc3_.items[param1] = true;
            ++_loc3_.length;
         }
         else if(_loc3_.items[param1] == null)
         {
            _loc3_.items[param1] = true;
            ++_loc3_.length;
         }
      }
      
      public function pop() : _1205
      {
         var _loc2_:DepthBin = null;
         var _loc3_:Object = null;
         var _loc1_:_1205 = null;
         if(this._9017 <= this._9018)
         {
            _loc2_ = this._9016[this._9018];
            while(!_loc2_ || _loc2_.length == 0)
            {
               --this._9018;
               if(this._9018 < this._9017)
               {
                  return null;
               }
               _loc2_ = this._9016[this._9018];
            }
            var _loc4_:int = 0;
            var _loc5_:* = _loc2_.items;
            for(_loc3_ in _loc5_)
            {
               _loc1_ = _loc3_ as _1205;
               this.remove(_loc1_,this._9018);
            }
            while(!_loc2_ || _loc2_.length == 0)
            {
               --this._9018;
               if(this._9018 < this._9017)
               {
                  break;
               }
               _loc2_ = this._9016[this._9018];
            }
         }
         return _loc1_;
      }
      
      public function shift() : _1205
      {
         var _loc2_:DepthBin = null;
         var _loc3_:Object = null;
         var _loc1_:_1205 = null;
         if(this._9017 <= this._9018)
         {
            _loc2_ = this._9016[this._9017];
            while(!_loc2_ || _loc2_.length == 0)
            {
               ++this._9017;
               if(this._9017 > this._9018)
               {
                  return null;
               }
               _loc2_ = this._9016[this._9017];
            }
            var _loc4_:int = 0;
            var _loc5_:* = _loc2_.items;
            for(_loc3_ in _loc5_)
            {
               _loc1_ = _loc3_ as _1205;
               this.remove(_loc1_,this._9017);
            }
            while(!_loc2_ || _loc2_.length == 0)
            {
               ++this._9017;
               if(this._9017 > this._9018)
               {
                  break;
               }
               _loc2_ = this._9016[this._9017];
            }
         }
         return _loc1_;
      }
      
      public function _9015(param1:_1205) : Object
      {
         var _loc4_:DepthBin = null;
         var _loc5_:Object = null;
         var _loc2_:int = this._9018;
         var _loc3_:int = param1._7569;
         while(_loc3_ <= _loc2_)
         {
            _loc4_ = this._9016[_loc2_];
            if((Boolean(_loc4_)) && _loc4_.length > 0)
            {
               if(_loc2_ == param1._7569)
               {
                  if(_loc4_.items[param1])
                  {
                     this.remove(_1205(param1),_loc2_);
                     return param1;
                  }
               }
               else
               {
                  for(_loc5_ in _loc4_.items)
                  {
                     if(_loc5_ is DisplayObject && param1 is DisplayObjectContainer && (param1 as DisplayObjectContainer).contains(DisplayObject(_loc5_)))
                     {
                        this.remove(_1205(_loc5_),_loc2_);
                        return _loc5_;
                     }
                  }
               }
               _loc2_--;
            }
            else
            {
               if(_loc2_ == this._9018)
               {
                  --this._9018;
               }
               _loc2_--;
               if(_loc2_ < _loc3_)
               {
                  break;
               }
            }
         }
         return null;
      }
      
      public function _9014(param1:_1205) : Object
      {
         var _loc3_:DepthBin = null;
         var _loc4_:Object = null;
         var _loc2_:int = param1._7569;
         while(_loc2_ <= this._9018)
         {
            _loc3_ = this._9016[_loc2_];
            if(Boolean(_loc3_) && _loc3_.length > 0)
            {
               if(_loc2_ == param1._7569)
               {
                  if(_loc3_.items[param1])
                  {
                     this.remove(_1205(param1),_loc2_);
                     return param1;
                  }
               }
               else
               {
                  for(_loc4_ in _loc3_.items)
                  {
                     if(_loc4_ is DisplayObject && param1 is DisplayObjectContainer && (param1 as DisplayObjectContainer).contains(DisplayObject(_loc4_)))
                     {
                        this.remove(_1205(_loc4_),_loc2_);
                        return _loc4_;
                     }
                  }
               }
               _loc2_++;
            }
            else
            {
               if(_loc2_ == this._9017)
               {
                  ++this._9017;
               }
               _loc2_++;
               if(_loc2_ > this._9018)
               {
                  break;
               }
            }
         }
         return null;
      }
      
      public function remove(param1:_1205, param2:int = -1) : _1205
      {
         var _loc3_:int = param2 >= 0 ? param2 : param1._7569;
         var _loc4_:DepthBin = this._9016[_loc3_];
         if((Boolean(_loc4_)) && _loc4_.items[param1] != null)
         {
            delete _loc4_.items[param1];
            --_loc4_.length;
            return param1;
         }
         return null;
      }
      
      public function _6162() : void
      {
         this._9016.length = 0;
         this._9017 = 0;
         this._9018 = -1;
      }
      
      public function isEmpty() : Boolean
      {
         return this._9017 > this._9018;
      }
   }
}

import flash.utils.Dictionary;

class DepthBin
{
   public var length:int;
   
   public var items:Dictionary;
   
   public function DepthBin()
   {
      this.items = new Dictionary();
      super();
   }
}

