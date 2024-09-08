package _470
{
   import _1404._1407;
   import _472._471;
   import _783.CommandNotification;
   
   public class _11495
   {
      private var _11569:Object = null;
      
      private var _11571:Array;
      
      private var _11567:Array;
      
      private var _11568:Array;
      
      public function _11495(param1:Object)
      {
         this._11571 = [];
         this._11567 = [];
         this._11568 = [];
         super();
         if(!param1)
         {
            throw new ArgumentError();
         }
         this._11569 = param1;
      }
      
      public static function _11570(param1:String, ... rest) : void
      {
         var _loc3_:Vector.<_11495> = new Vector.<_11495>();
         var _loc4_:Function = null;
         var _loc5_:uint = 0;
         var _loc6_:uint = uint(rest.length);
         while(_loc5_ < _loc6_)
         {
            if(rest[_loc5_] is _11495)
            {
               _loc3_.push(rest[_loc5_]);
            }
            else if(rest[_loc5_] is Function)
            {
               _loc4_ = rest[_loc5_];
            }
            _loc5_++;
         }
         _11566(param1,_loc3_,_loc4_);
      }
      
      public static function _11566(param1:String, param2:Vector.<_11495>, param3:Function = null) : void
      {
         if(!param2 || param2.length < 1)
         {
            return;
         }
         var _loc4_:_471 = _1407.getInstance(_471) as _471;
         if(_loc4_)
         {
            _loc4_._1567(new CommandNotification(param1,[param1,param2,param3]));
         }
      }
      
      public static function create(param1:Object) : _11495
      {
         return new _11495(param1);
      }
      
      public function add(param1:String, param2:*) : _11495
      {
         var _loc3_:int = int(this._11571.indexOf(param1));
         if(_loc3_ < 0)
         {
            this._11571.push(param1);
            this._11567.push(this._11569[param1]);
            this._11568.push(param2);
         }
         else
         {
            this._11567[_loc3_] = this._11569[param1];
            this._11568[_loc3_] = param2;
         }
         return this;
      }
      
      public function setTo() : void
      {
         var _loc3_:String = null;
         var _loc1_:uint = 0;
         var _loc2_:uint = this._11571.length;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._11571[_loc1_];
            this._11569[_loc3_] = this._11568[_loc1_];
            _loc1_++;
         }
      }
      
      public function _11560() : void
      {
         var _loc3_:String = null;
         var _loc1_:uint = 0;
         var _loc2_:uint = this._11571.length;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._11571[_loc1_];
            this._11569[_loc3_] = this._11567[_loc1_];
            _loc1_++;
         }
      }
      
      public function get object() : Object
      {
         return this._11569;
      }
   }
}

