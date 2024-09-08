package _755
{
   import _724._13550;
   import _81._84;
   
   public class _757
   {
      public var _3284:Object;
      
      public var projectPath:String;
      
      public var _5850:Array;
      
      public var _1778:Array;
      
      public var _13788:Array;
      
      public function _757(param1:Object, param2:String, param3:Array = null)
      {
         super();
         this._3284 = param1;
         this.projectPath = param2;
         this._5850 = [];
         this._1778 = [];
         this._13788 = !!param3 ? param3 : [];
         this.refresh();
      }
      
      public function refresh() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         this._1778.length = 0;
         this._5850.length = 0;
         for(_loc2_ in this._3284)
         {
            this._1778.push(_loc2_);
            _loc1_ = this._3284[_loc2_];
            if(this._5850.indexOf(_loc1_) == -1)
            {
               this._5850.push(_loc1_);
            }
         }
      }
      
      public function _2950(param1:String, param2:String) : void
      {
         this._3284[param2] = this._3284[param1];
         delete this._3284[param1];
         this.refresh();
      }
      
      public function _13744(param1:_13550) : void
      {
         _84._1979(param1,this._13788);
      }
      
      public function _13743(param1:Array) : void
      {
         var _loc2_:int = -1;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = int(this._13788.indexOf(param1[_loc3_]));
            if(_loc2_ >= 0)
            {
               this._13788.splice(_loc2_,1);
            }
            _loc3_++;
         }
      }
      
      public function _13947(param1:_13550, param2:int) : void
      {
         var _loc3_:int = int(this._13788.indexOf(param1));
         this._13788.splice(_loc3_,1);
         this._13788.splice(param2,0,param1);
      }
      
      public function get name() : String
      {
         return "library";
      }
   }
}

