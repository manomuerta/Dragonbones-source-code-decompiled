package _1421
{
   import flash.events.Event;
   
   public class FTETextEvent extends Event
   {
      public static const FTE_TEXT_CHANGED:String = "fteTextChanged";
      
      public static const FTE_TEXT_INPUTING:String = "fteTextInputing";
      
      public var _9924:int = 0;
      
      public var _9937:int = 0;
      
      public var _9927:int = 0;
      
      public var _9940:int = 0;
      
      public var _9931:String = "";
      
      public var _9941:String = "";
      
      public var _9915:Boolean = false;
      
      public var _9960:Boolean = false;
      
      public function FTETextEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

