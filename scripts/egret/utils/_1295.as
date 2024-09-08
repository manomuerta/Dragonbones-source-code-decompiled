package egret.utils
{
   import flash.utils.Dictionary;
   
   public class _1295
   {
      private var keyDic:Dictionary;
      
      private var _9087:Dictionary;
      
      private var _9088:int = 200;
      
      private var _9089:int = 0;
      
      public function _1295(param1:int = 200)
      {
         this.keyDic = new Dictionary();
         super();
         if(param1 < 1)
         {
            param1 = 1;
         }
         this._9088 = param1;
      }
      
      private function _3784(param1:String) : *
      {
         var _loc4_:* = undefined;
         var _loc2_:Dictionary = this.keyDic[param1];
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:Boolean = false;
         for(_loc4_ in _loc2_)
         {
            if(_loc2_[_loc4_] === param1)
            {
               _loc3_ = true;
               break;
            }
         }
         if(!_loc3_)
         {
            _loc4_ = null;
            delete this.keyDic[param1];
         }
         return _loc4_;
      }
      
      public function set(param1:String, param2:*) : void
      {
         var _loc4_:* = undefined;
         var _loc3_:Dictionary = this.keyDic[param1];
         if(_loc3_)
         {
            _loc4_ = this._3784(param1);
            if(_loc4_ != null)
            {
               delete _loc3_[_loc4_];
            }
         }
         else
         {
            if(this._9089 % this._9088 == 0)
            {
               this._9087 = new Dictionary(true);
            }
            _loc3_ = this._9087;
            ++this._9089;
         }
         if(_loc3_[param2] !== undefined)
         {
            _loc3_ = this._9087 = new Dictionary(true);
         }
         this.keyDic[param1] = _loc3_;
         _loc3_[param2] = param1;
      }
      
      public function get(param1:String) : *
      {
         return this._3784(param1);
      }
      
      public function has(param1:String) : Boolean
      {
         var _loc4_:* = undefined;
         var _loc2_:Dictionary = this.keyDic[param1];
         if(!_loc2_)
         {
            return false;
         }
         var _loc3_:Boolean = false;
         for(_loc4_ in _loc2_)
         {
            if(_loc2_[_loc4_] === param1)
            {
               _loc3_ = true;
               break;
            }
         }
         if(!_loc3_)
         {
            delete this.keyDic[param1];
         }
         return _loc3_;
      }
      
      public function remove(param1:String) : Boolean
      {
         var _loc2_:* = this._3784(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:Dictionary = this.keyDic[param1];
         delete this.keyDic[param1];
         delete _loc3_[_loc2_];
         return true;
      }
      
      public function get keys() : Vector.<String>
      {
         var _loc3_:String = null;
         var _loc4_:Dictionary = null;
         var _loc5_:String = null;
         var _loc1_:Vector.<String> = new Vector.<String>();
         var _loc2_:Dictionary = new Dictionary();
         for(_loc3_ in this.keyDic)
         {
            _loc4_ = this.keyDic[_loc3_];
            if(!_loc2_[_loc4_])
            {
               _loc2_[_loc4_] = true;
               for each(_loc5_ in _loc4_)
               {
                  _loc1_.push(_loc5_);
               }
            }
         }
         return _loc1_;
      }
      
      public function get values() : Array
      {
         var _loc3_:String = null;
         var _loc4_:Dictionary = null;
         var _loc5_:* = undefined;
         var _loc1_:Array = [];
         var _loc2_:Dictionary = new Dictionary();
         for(_loc3_ in this.keyDic)
         {
            _loc4_ = this.keyDic[_loc3_];
            if(!_loc2_[_loc4_])
            {
               _loc2_[_loc4_] = true;
               for(_loc5_ in _loc4_)
               {
                  _loc1_.push(_loc5_);
               }
            }
         }
         return _loc1_;
      }
      
      public function refresh() : void
      {
         var _loc2_:String = null;
         var _loc1_:Vector.<String> = this.keys;
         for each(_loc2_ in _loc1_)
         {
            delete this.keyDic[_loc2_];
         }
      }
   }
}

