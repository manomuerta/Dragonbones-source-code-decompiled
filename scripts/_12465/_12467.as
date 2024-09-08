package _12465
{
   import _1529._1530;
   
   public class _12467
   {
      public static var _12721:Number = 0;
      
      public var id:int;
      
      public var name:String;
      
      public var desc:String;
      
      public var price:Number;
      
      public var _12722:int;
      
      public var _12723:Number;
      
      public var limit:int;
      
      public var left:int;
      
      private var _13026:String;
      
      private var _13028:String;
      
      private var _13025:String;
      
      private var _13027:String;
      
      private var num:int;
      
      private var _13022:Number;
      
      private var _13024:Number;
      
      private var language:String;
      
      public function _12467(param1:int, param2:String, param3:String, param4:String, param5:String, param6:int, param7:Number, param8:Number, param9:int, param10:int, param11:String)
      {
         super();
         this.id = param1;
         this._13026 = param2;
         this._13028 = param3;
         this._13025 = param4;
         this._13027 = param5;
         this.num = param6;
         this._12722 = param6;
         this._13022 = param7;
         this._13024 = param8;
         this.left = param9;
         this.limit = param10;
         this.language = param11;
         if(this.language == _1530.zh_CN)
         {
            this.name = param5;
            this.desc = param3;
            this.price = param7;
            this._12723 = _12721 * this.num;
         }
         else
         {
            this.name = param4;
            this.desc = param2;
            this.price = param8;
            this._12723 = _12721 * this.num;
         }
      }
   }
}

