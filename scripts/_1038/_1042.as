package _1038
{
   import _1177.CollectionEvent;
   import _1177._1178;
   import flash.events.EventDispatcher;
   
   public class _1042 extends EventDispatcher implements _1039, _1041
   {
      private var _5856:String;
      
      private var _5859:String;
      
      private var _5864:Object;
      
      private var _5852:Function;
      
      private var _5863:Array;
      
      private var _5857:Array;
      
      private var _5858:Boolean = false;
      
      public function _1042(param1:String = "children", param2:String = "parent")
      {
         this._5863 = [];
         this._5857 = [];
         super();
         this._5856 = param1;
         this._5859 = param2;
      }
      
      public static function _5854(param1:Object, param2:String = "children", param3:String = "parent") : void
      {
         var _loc4_:Object = null;
         if(!param1.hasOwnProperty(param2))
         {
            return;
         }
         for each(_loc4_ in param1[param2])
         {
            try
            {
               _loc4_[param3] = param1;
            }
            catch(e:Error)
            {
            }
            _5854(_loc4_,param2,param3);
         }
      }
      
      public function get source() : Object
      {
         return this._5864;
      }
      
      public function set source(param1:Object) : void
      {
         this._5864 = param1;
         this._5857 = [];
         this._5863 = [];
         if(this._5864)
         {
            if(this._5858)
            {
               this._5863.push(this._5864);
            }
            else
            {
               this._5857 = [this._5864];
               this._5855(this._5864,this._5863);
            }
         }
         this._5853(_1178.RESET);
      }
      
      public function get _4505() : Function
      {
         return this._5852;
      }
      
      public function set _4505(param1:Function) : void
      {
         if(this._5852 == param1)
         {
            return;
         }
         this._5852 = param1;
         this.refresh();
      }
      
      private function isShow(param1:Object) : Boolean
      {
         if(this._5852 != null)
         {
            if(this._5852.length == 1)
            {
               return this._5852(param1);
            }
            return this._5852(param1,this);
         }
         return true;
      }
      
      public function get _5860() : Array
      {
         return this._5857.concat();
      }
      
      public function set _5860(param1:Array) : void
      {
         this._5857 = !!param1 ? param1.concat() : [];
         this.refresh();
      }
      
      public function get length() : int
      {
         return this._5863.length;
      }
      
      public function getItemAt(param1:int) : Object
      {
         return this._5863[param1];
      }
      
      public function getItemIndex(param1:Object) : int
      {
         var _loc2_:int = int(this._5863.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._5863[_loc3_] === param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function _4016(param1:Object) : void
      {
         var _loc2_:int = this.getItemIndex(param1);
         if(_loc2_ != -1)
         {
            this._5853(_1178.UPDATE,_loc2_,-1,[param1]);
         }
      }
      
      public function removeItem(param1:Object) : void
      {
         if(this._4530(param1))
         {
            this._4745(param1);
         }
         if(!param1)
         {
            return;
         }
         var _loc2_:Object = param1[this._5859];
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Array = _loc2_[this._5856];
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:int = int(_loc3_.indexOf(param1));
         if(_loc4_ != -1)
         {
            _loc3_.splice(_loc4_,1);
         }
         param1[this._5859] = null;
         _loc4_ = int(this._5863.indexOf(param1));
         if(_loc4_ != -1)
         {
            this._5863.splice(_loc4_,1);
            this._5853(_1178.REMOVE,_loc4_,-1,[param1]);
         }
      }
      
      public function get _5804() : Boolean
      {
         return this._5858;
      }
      
      public function set _5804(param1:Boolean) : void
      {
         if(this._5858 == param1)
         {
            return;
         }
         this._5858 = param1;
         if(this._5864)
         {
            if(this._5858)
            {
               this._5863.splice(0,0,this._5864);
            }
            else
            {
               this._5863.shift();
               if(this._5860.indexOf(this._5864) == -1)
               {
                  this._5860.push(this._5864);
               }
            }
            this.refresh();
         }
      }
      
      private function _5855(param1:Object, param2:Array) : void
      {
         var _loc3_:Object = null;
         if(!this.isShow(param1) || !param1.hasOwnProperty(this._5856) || this._5857.indexOf(param1) == -1)
         {
            return;
         }
         for each(_loc3_ in param1[this._5856])
         {
            if(this.isShow(_loc3_))
            {
               param2.push(_loc3_);
               this._5855(_loc3_,param2);
            }
         }
      }
      
      public function _4521(param1:Object) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         if(param1.hasOwnProperty(this._5856))
         {
            if(param1[this._5856].length > 0)
            {
               _loc3_ = 0;
               while(_loc3_ < param1[this._5856].length)
               {
                  _loc4_ = param1[this._5856][_loc3_];
                  if(this.isShow(_loc4_))
                  {
                     _loc2_ = true;
                     break;
                  }
                  _loc3_++;
               }
               return _loc2_;
            }
         }
         return false;
      }
      
      public function _4530(param1:Object) : Boolean
      {
         return this._5857.indexOf(param1) != -1;
      }
      
      public function _4529(param1:Object, param2:Boolean = true) : void
      {
         if(param2)
         {
            this._4752(param1);
         }
         else
         {
            this._4745(param1);
         }
      }
      
      private function _4752(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         if(this._5857.indexOf(param1) == -1 && this.isShow(param1))
         {
            this._5857.push(param1);
            _loc2_ = int(this._5863.indexOf(param1));
            if(_loc2_ != -1)
            {
               _loc3_ = [];
               this._5855(param1,_loc3_);
               _loc4_ = _loc2_;
               while(_loc3_.length)
               {
                  _loc4_++;
                  _loc5_ = _loc3_.shift();
                  this._5863.splice(_loc4_,0,_loc5_);
                  this._5853(_1178.ADD,_loc4_,-1,[_loc5_]);
               }
               this._5853("open",_loc2_,_loc2_,[param1]);
            }
         }
      }
      
      private function _4745(param1:Object) : void
      {
         var _loc4_:Object = null;
         var _loc2_:int = int(this._5857.indexOf(param1));
         if(_loc2_ == -1)
         {
            return;
         }
         var _loc3_:Array = [];
         this._5855(param1,_loc3_);
         this._5857.splice(_loc2_,1);
         _loc2_ = int(this._5863.indexOf(param1));
         if(_loc2_ != -1)
         {
            _loc2_++;
            while(_loc3_.length)
            {
               _loc4_ = this._5863.splice(_loc2_,1)[0];
               this._5853(_1178.REMOVE,_loc2_,-1,[_loc4_]);
               _loc3_.shift();
            }
            _loc2_--;
            this._5853(_1178.CLOSE,_loc2_,_loc2_,[param1]);
         }
      }
      
      public function _5862(param1:Object) : int
      {
         var _loc2_:int = 0;
         var _loc3_:Object = param1[this._5859];
         while(_loc3_)
         {
            _loc2_++;
            _loc3_ = _loc3_[this._5859];
         }
         if(_loc2_ > 0 && !this._5858)
         {
            _loc2_--;
         }
         return _loc2_;
      }
      
      public function refresh() : void
      {
         this._5863 = [];
         if(this._5864)
         {
            if(this._5858)
            {
               this._5863.push(this._5864);
            }
            this._5855(this._5864,this._5863);
         }
         this._5853(_1178.REFRESH);
      }
      
      private function _5853(param1:String = null, param2:int = -1, param3:int = -1, param4:Array = null, param5:Array = null) : void
      {
         var _loc6_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,false,param1,param2,param3,param4,param5);
         dispatchEvent(_loc6_);
      }
   }
}

