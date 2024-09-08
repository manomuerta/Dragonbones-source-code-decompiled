package _668
{
   import _1038._1042;
   import _51._50;
   import _648._665;
   import _692._696;
   import _724._13550;
   import _93._95;
   import flash.utils.Dictionary;
   
   public class _670 extends _95
   {
      private static var _5801:Dictionary = new Dictionary();
      
      private var _4133:_665;
      
      private var _5803:_696;
      
      public function _670()
      {
         super();
      }
      
      public function get _2871() : _665
      {
         return this._4133;
      }
      
      public function set _2871(param1:_665) : void
      {
         if(this._4133 == param1)
         {
            return;
         }
         if(this._5803)
         {
            this._5803.dispose();
         }
         this._4133 = param1;
         if(this._4133)
         {
            if(!this._3997)
            {
               _5801[this._4133] = new _1042();
            }
            this._5803 = new _696(this._4133.libraryData,this._4133.dragonBonesVO);
            this._3997.source = this._5803;
            this._4154(this._4133._2865.name);
         }
      }
      
      public function _4147(param1:String) : void
      {
         this._5803._4147(param1);
         this._3997._4529(this._5803._4162);
         this._3997.refresh();
      }
      
      public function _4154(param1:String) : void
      {
         this._5803._4154(param1);
         this._3997._4529(this._5803._4162);
         this._3997.refresh();
      }
      
      public function get _3997() : _1042
      {
         return _5801[this._4133];
      }
      
      public function get _4149() : _696
      {
         return this._5803;
      }
      
      public function _2867(param1:_50, param2:String) : void
      {
         this._5803._2867(param1,param2);
         this._3997.refresh();
      }
      
      public function _13787(param1:_50, param2:String, param3:Object) : void
      {
         this._5803._2867(param1,param2,param3);
         this._3997.refresh();
      }
      
      public function _2863(param1:String) : void
      {
         this._5803._2863(param1);
         this._3997.refresh();
      }
      
      public function _13790(param1:_13550) : void
      {
         this._5803._13790(param1);
         this._3997.refresh();
      }
      
      public function _13735(param1:_13550) : void
      {
         this._5803._13735(param1);
         this._3997.refresh();
      }
   }
}

