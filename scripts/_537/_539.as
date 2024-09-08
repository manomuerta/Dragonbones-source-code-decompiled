package _537
{
   import _13492._13496;
   
   public class _539
   {
      public var id:int;
      
      public var _3897:Vector.<_13496>;
      
      private var _3932:int;
      
      private var _3933:int;
      
      public var _3923:int;
      
      public var _3925:int;
      
      public function _539()
      {
         super();
      }
      
      public function _3928() : void
      {
         var _loc1_:int = 0;
         if(this.startIndex != this._3923)
         {
            this.startIndex = this._3923;
         }
         if(this.endIndex != this._3925)
         {
            this.endIndex = this._3925;
         }
         if(this.startIndex > this.endIndex)
         {
            _loc1_ = this.startIndex;
            this.startIndex = this.endIndex;
            this.endIndex = _loc1_;
         }
      }
      
      public function _3924(param1:int) : void
      {
         this.startIndex += param1;
         this.endIndex += param1;
      }
      
      public function get startIndex() : int
      {
         return this._3932;
      }
      
      public function set startIndex(param1:int) : void
      {
         this._3932 = param1;
         this._3923 = this._3932;
      }
      
      public function get endIndex() : int
      {
         return this._3933;
      }
      
      public function set endIndex(param1:int) : void
      {
         this._3933 = param1;
         this._3925 = this._3933;
      }
   }
}

